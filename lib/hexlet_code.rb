# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload(:Tag, 'hexlet_code/tag')
  autoload(:FormContent, 'hexlet_code/form_content')
  autoload(:FormRenderer, 'hexlet_code/form_renderer')

  def self.form_for(object, args = {}, &block)
    args[:action] = args[:url] || '#'
    args[:method] ||= 'post'
    FormRenderer.new.build_form(object, **args, &block)
  end
end
