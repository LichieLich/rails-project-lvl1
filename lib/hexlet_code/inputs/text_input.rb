# frozen_string_literal: true

module HexletCode
  class Inputs
    class TextInput
      def self.build(args = {})
        options = args
        options.delete :as
        options[:cols] ||= 20
        options[:rows] ||= 40
        options[:name] = args[:attribute]
        options.delete :attribute
        HexletCode::Tag.build('textarea', **options) { options[:value] }
      end
    end
  end
end
