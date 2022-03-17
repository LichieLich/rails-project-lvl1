# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'nested_tag_creator'

module HexletCode
  autoload(:Tag, 'tag')

  def self.form_for(object, args = {}, &block)
    args[:action] = args[:url] || '#'
    args[:method] = 'post'
    nested_tag = block.call(NestedTagCreator.new(object)) if block_given?
    Tag.build('form', **args) { "#{nested_tag}\n" }
  end
end
