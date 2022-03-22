# frozen_string_literal: true

module HexletCode
  class NestedTagContent
    attr_accessor :object, :inputs, :submit_button

    def initialize(object)
      @object = object
      @inputs = []
    end

    def input(attribute, **args)
      @inputs << [attribute, { **args }]
    end

    def submit(button_name = 'Save', **args)
      @submit_button = [button_name, { **args }]
    end
  end
end
