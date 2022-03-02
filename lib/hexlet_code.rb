# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'nested_tag_creator'

module HexletCode
  autoload(:Tag, './lib/tag.rb')

  def self.form_for(user, url: nil)
    Tag.build('form', action: url || '#', method: 'post') { "#{yield(NestedTagCreator.new(user))}\n" }
  end
end
