# frozen_string_literal: true

module HexletCode
  class FormContent
    attr_accessor :object, :inputs, :submit_button

    def initialize(object)
      @object = object
      @inputs = []
    end

    def input(attribute, args = {})
      args[:attribute] = attribute
      args[:value] = @object.public_send(attribute)
      @inputs << args
    end

    def submit(button_name = 'Save', args = {})
      args[:submit_button] = button_name
      @submit_button = args
    end
  end
end
