# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'nested_tag_creator'

module HexletCode
  autoload(:Tag, 'tag')

  def self.form_for(user, url: nil, &block)
    nested_tag = block.call(NestedTagCreator.new(user)) if block_given?
    Tag.build('form', action: url || '#', method: 'post') { "#{nested_tag}\n" }
  end
end
