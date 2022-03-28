# frozen_string_literal: true

require_relative 'inputs/input'
require_relative 'inputs/text_input'

module HexletCode
  class FormRenderer
    attr_accessor :tags_info, :form

    def initialize(tags_info = nil)
      @tags_info = tags_info
      @form = []
    end

    def build_form(nested_tags, args = {})
      Tag.build('form', **args) { "\n#{nested_tags}\n" }
    end

    def build_form_content
      unless @tags_info.inputs.empty?
        @tags_info.inputs.each do |input|
          @form << "  #{build_input(input[:attribute], **input)}"
        end
      end
      @form << "  #{build_submit(@tags_info.submit_button)}" if @tags_info.submit_button
      @form = @form.join("\n")
      @form
    end

    def build_input(attribute, args = {})
      @form << "  #{add_label(attribute)}"
      input_type = (args[:as].nil? ? '' : args[:as].capitalize)
      input_class = "HexletCode::Inputs::#{input_type}Input"
      Object.const_get(input_class).build(**args)
    end

    def build_submit(submit)
      submit_name = submit[:submit_button] || 'Save'
      submit.delete :submit_button
      submit[:name] = 'commit'
      submit[:type] = 'submit'
      submit[:value] = submit_name
      HexletCode::Tag.build('input', **submit)
    end

    def add_label(attribute)
      HexletCode::Tag.build('label', for: attribute) { attribute.capitalize }
    end
  end
end
