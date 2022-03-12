# frozen_string_literal: true

class NestedTagCreator
  attr_accessor :user, :result_nested_tags

  def initialize(user)
    @user = user
    @all_nested_tags = ''
  end

  def input(attribute, **args)
    @all_nested_tags += add_label(attribute)
    @all_nested_tags +=
      if args[:as] == :text
        "\n  #{HexletCode::Tag.build('textarea', cols: args[:cols] || 20, rows: args[:rows] || 40, name: attribute) do
                 @user.public_send(attribute)
               end }"
      else
        args[:name] = attribute
        args[:type] = 'text'
        args[:value] = @user.public_send(attribute)
        "\n  #{HexletCode::Tag.build('input', **args)}"
      end
  end

  def add_label(attribute)
    "\n  #{HexletCode::Tag.build('label', for: attribute) { attribute.capitalize }}"
  end

  def submit(button_name = 'Save')
    @all_nested_tags += "\n  #{HexletCode::Tag.build('input', name: 'commit', type: 'submit', value: button_name)}"
  end
end
