# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'nested_tag_creator'

module HexletCode
  autoload(:Tag, 'tag')
  module HexletCode::Tag
    def self.build(type, **params)
      preparatory_tag = []
      if params
        preparatory_tag << "<#{type}"
        params.each { |param, value| preparatory_tag << "#{param}=\"#{value}\"" }
      end
      content = yield if block_given?
      single_tag?(type) ? "#{preparatory_tag.join(' ')}>" : "#{preparatory_tag.join(' ')}>#{content}</#{type}>"
    end

    def self.single_tag?(type)
      %w[area base basefont bgsound br col command embed hr img input
         isindex keygen link meta param source track wbr].include? type
    end
  end

  def self.form_for(user, url: nil, &block)
    nested_tag = block.call(NestedTagCreator.new(user)) if block_given?
    Tag.build('form', action: url || '#', method: 'post') { "#{nested_tag}\n" }
  end
end
