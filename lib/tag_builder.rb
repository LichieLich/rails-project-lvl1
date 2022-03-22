# frozen_string_literal: true

module HexletCode
  class TagBuilder
    attr_accessor :tags_info, :form

    def initialize(tags_info)
      @tags_info = tags_info
      @form = []
      unless tags_info.inputs.empty?
        tags_info.inputs.each do |input|
          @form << "  #{build_input(input[0], **input[1])}"
        end
      end
      @form << "  #{build_submit(tags_info.submit_button)}" if tags_info.submit_button
      @form = @form.join("\n")
    end

    def build_input(attribute, **args)
      @form << "  #{add_label(attribute)}"
      if args[:as] == :text
        args.delete :as
        args[:cols] ||= 20
        args[:rows] ||= 40
        args[:name] = attribute
        type = 'textarea'
      else
        args[:name] = attribute
        args[:type] = 'text'
        args[:value] = @tags_info.object.public_send(attribute)
        type = 'input'
      end
      create_tag(type, **args)
    end

    def build_submit(submit)
      submit_name = submit[0] || 'Save'
      args = submit[1]
      args[:name] = 'commit'
      args[:type] = 'submit'
      args[:value] = submit_name
      create_tag('input', **args)
    end

    def add_label(attribute)
      HexletCode::Tag.build('label', for: attribute) { attribute.capitalize }
    end

    def create_tag(type, **args)
      if type == 'textarea'
        HexletCode::Tag.build(type, **args) { @tags_info.object.public_send(args[:name]) }
      else
        HexletCode::Tag.build(type, **args)
      end
    end
  end
end
