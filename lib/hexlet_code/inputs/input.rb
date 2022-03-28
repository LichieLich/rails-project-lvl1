# frozen_string_literal: true

module HexletCode
  class Inputs
    class Input
      def self.build(args = {})
        options = args
        options[:name] = options[:attribute]
        options.delete :attribute
        options[:type] = 'text'
        HexletCode::Tag.build('input', **options)
      end
    end
  end
end
