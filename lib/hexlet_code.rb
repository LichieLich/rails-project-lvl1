# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'embeded_tag_creator'

module HexletCode
  class Tag
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

  def self.form_for(user, url: nil)
    Tag.build('form', action: url || '#', method: 'post') { "#{yield(EmbededTagCreator.new(user))}\n" }
  end
end
