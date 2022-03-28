# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload(:Tag, 'hexlet_code/tag')
  autoload(:FormContent, 'hexlet_code/form_content')
  autoload(:FormRenderer, 'hexlet_code/form_renderer')

  def self.form_for(object, args = {}, &block)
    args[:action] = args[:url] || '#'
    args[:method] ||= 'post'
    nested_tags_info = FormContent.new(object)
    block.call(nested_tags_info) if block_given?
    nested_tags = FormRenderer.new(nested_tags_info).build_form_content
    FormRenderer.new.build_form(nested_tags, **args)
  end
end
