# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'nested_tag_content'
require_relative 'tag_builder'

module HexletCode
  autoload(:Tag, 'tag')

  def self.form_for(object, args = {}, &block)
    args[:action] = args[:url] || '#'
    args[:method] = 'post'
    nested_tags_info = NestedTagContent.new(object)
    block.call(nested_tags_info) if block_given?
    nested_tags = TagBuilder.new(nested_tags_info).form
    Tag.build('form', **args) { "\n#{nested_tags}\n" }
  end
end
