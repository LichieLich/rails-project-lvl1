# frozen_string_literal: true

module HexletCode
  class Inputs
    class TextInput
      def self.build(args = {})
        args[:cols] ||= 20
        args[:rows] ||= 40
        options = args.reject { |key| key == :as }
        HexletCode::Tag.build('textarea', **options) { args[:value] }
      end
    end
  end
end
