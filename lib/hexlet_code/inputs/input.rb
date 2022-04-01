# frozen_string_literal: true

module HexletCode
  class Inputs
    class Input
      def self.build(args = {})
        args[:type] = 'text'
        HexletCode::Tag.build('input', **args)
      end
    end
  end
end
