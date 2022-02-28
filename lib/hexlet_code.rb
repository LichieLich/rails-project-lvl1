# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  class Tag
    def self.build(type, **params)
      preparatory_tag = []
      if params
        preparatory_tag << "<#{type}"
        params.each do |param, value|
          preparatory_tag << "#{param}=\"#{value}\""
        end
      end
      content = yield if block_given?
      single_tag?(type) ? "#{preparatory_tag.join(' ')}>" : "#{preparatory_tag.join(' ')}>#{content}</#{type}>"
    end

    def self.single_tag?(type)
      %w[area base basefont bgsound br col command embed hr img input
         isindex keygen link meta param source track wbr].include? type
    end
  end
end
