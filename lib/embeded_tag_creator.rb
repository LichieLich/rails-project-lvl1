class EmbededTagCreator
  attr_accessor :user, :result_embeded_tags

  def initialize(user)
    @user = user
    @all_embeded_tags = ""
  end

  def input(attribute, as: nil)
    @all_embeded_tags << case as
      when :text
        "\n  #{HexletCode::Tag.build('textarea', cols: 20, rows: 40, name: attribute) { @user.public_send(attribute) }}"
      when nil
        "\n  #{HexletCode::Tag.build('input', name: attribute, type: 'text', value: @user.public_send(attribute))}"
      end
  end
end
