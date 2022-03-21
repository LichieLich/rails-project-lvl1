# frozen_string_literal: true

module HexletCode
  class TagBuilder
    attr_accessor :tags_info, :form

    def initialize(tags_info)
      @tags_info = tags_info
      @form = []
      unless tags_info.inputs.empty?
        tags_info.inputs.each do |input|
          @form << "  #{build_input(input)}"
        end
      end
      @form << "  #{build_submit(tags_info.submit_button)}" if tags_info.submit_button
      @form = @form.join("\n")
    end

    def build_input(input)
      attribute = input[0]
      args = input[1]
      @form << "  #{HexletCode::Tag.build('label', for: attribute) { attribute.capitalize }}"
      if args[:as] == :text
        args.delete :as
        args[:cols] ||= 20
        args[:rows] ||= 40
        args[:name] = attribute
        HexletCode::Tag.build('textarea', **args) { @tags_info.object.public_send(attribute) }
      else
        args[:name] = attribute
        args[:type] = 'text'
        args[:value] = @tags_info.object.public_send(attribute)
        HexletCode::Tag.build('input', **args)
      end
    end

    def build_submit(submit)
      submit_name = submit[0] || 'Save'
      args = submit[1]
      args[:name] = 'commit'
      args[:type] = 'submit'
      args[:value] = submit_name
      HexletCode::Tag.build('input', **args)
    end

    # def add_label(attribute)
    #   HexletCode::Tag.build('label', for: attribute) { attribute.capitalize }
    # end
  end
end
