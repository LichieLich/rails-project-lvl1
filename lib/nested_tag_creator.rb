# frozen_string_literal: true

class NestedTagCreator
  attr_accessor :user, :result_nested_tags

  def initialize(user)
    @user = user
    @all_nested_tags = ''
  end

  def input(attribute, as: nil)
    @all_nested_tags += add_label(attribute)
    @all_nested_tags +=
      case as
      when :text
        "\n  #{HexletCode::Tag.build('textarea', cols: 20, rows: 40, name: attribute) { @user.public_send(attribute) }}"
      when nil
        "\n  #{HexletCode::Tag.build('input', name: attribute, type: 'text', value: @user.public_send(attribute))}"
      end
  end

  def add_label(attribute)
    "\n  #{HexletCode::Tag.build('label', for: attribute) { attribute.capitalize }}"
  end

  def submit(button_name = 'Save')
    @all_nested_tags += "\n  #{HexletCode::Tag.build('input', name: 'commit', type: 'submit', value: button_name)}"
  end
end
