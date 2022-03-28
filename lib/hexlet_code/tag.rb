# frozen_string_literal: true

module HexletCode
  module Tag
    def self.build(type, params = {})
      preparatory_tag = prepare_tag(type, **params)
      return "#{preparatory_tag}>" if single_tag?(type)

      content = yield if block_given?
      "#{preparatory_tag}>#{content}</#{type}>"
    end

    def self.single_tag?(type)
      %w[area base basefont bgsound br col command embed hr img input
         isindex keygen link meta param source track wbr].include? type
    end

    def self.prepare_tag(type, params = {})
      preparatory_tag = []
      preparatory_tag << "<#{type}"
      params.each { |param, value| preparatory_tag << "#{param}=\"#{value}\"" } unless params.empty?
      preparatory_tag.join(' ')
    end
  end
end
