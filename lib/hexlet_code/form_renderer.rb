# frozen_string_literal: true

require_relative 'inputs/input'
require_relative 'inputs/text_input'

module HexletCode
  class FormRenderer
    attr_accessor :tags_info, :form

    def initialize
      @form = []
    end

    def build_form(object, args = {}, &block)
      nested_tags_info = FormContent.new(object)
      block.call(nested_tags_info) if block_given?
      Tag.build('form', **args) { "\n#{build_form_content(nested_tags_info)}\n" }
    end

    def build_form_content(tags_info)
      tags_info.inputs.each do |input|
        @form << "  #{build_input(**input)}"
      end
      @form << "  #{build_submit(tags_info.submit_button)}" if tags_info.submit_button
      @form = @form.join("\n")
      @form
    end

    def build_input(args = {})
      @form << "  #{add_label(args[:name])}"
      input_type = (args[:as].nil? ? '' : args[:as].capitalize)
      input_class = "HexletCode::Inputs::#{input_type}Input"
      Object.const_get(input_class).build(**args)
    end

    def build_submit(submit)
      submit[:name] = 'commit'
      submit[:type] = 'submit'
      HexletCode::Tag.build('input', **submit)
    end

    def add_label(attribute)
      HexletCode::Tag.build('label', for: attribute) { attribute.capitalize }
    end
  end
end
