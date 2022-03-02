# frozen_string_literal: true

require 'test_helper'

class HexletCodeTest < Minitest::Test
  def setup
    @user = User.new name: 'rob', job: 'hexlet'
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_single_tag
    assert_equal '<br>', HexletCode::Tag.build('br')
    assert_equal '<img src="path/to/image">', HexletCode::Tag.build('img', src: 'path/to/image')
    assert_equal '<input type="submit" value="Save">', HexletCode::Tag.build('input', type: 'submit', value: 'Save')
  end

  def test_pair_tag
    assert_equal '<div></div>', HexletCode::Tag.build('div')
  end

  def test_pair_tag_with_content
    assert_equal '<label for="email">Email</label>', HexletCode::Tag.build('label', for: 'email') { 'Email' }
  end

  def test_form_generates_without_url
    assert_equal "<form action=\"#\" method=\"post\">\n</form>", HexletCode.form_for(@user) { |f| }
  end

  def test_form_generates_without_url
    assert_equal "<form action=\"/users\" method=\"post\">\n</form>", HexletCode.form_for(@user, url: '/users') { |f| }
  end

  def test_it_raises_no_method_error
    assert_raises(NoMethodError) do
      HexletCode.form_for(@user, url: '/users') { |f| f.input :age }
    end
  end

  def test_it_generates_input_in_form
    html = File.open('./fixture/files/simple_input.html', 'r') { |file| file.read }
    # TODO Если передавать блоке в виде do-end, то он передаётся методу assert_eqal. Переделать нормально
    assert_equal html, HexletCode.form_for(@user) { |f| f.input :name }
  end

  def test_it_generates_input_in_form_with_as_text_option
    html = File.open('./fixture/files/as_text_input.html', 'r') { |file| file.read }
    # TODO Если передавать блоке в виде do-end, то он передаётся методу assert_eqal. Переделать нормально
    assert_equal html, HexletCode.form_for(@user) { |f| f.input :name; f.input :job, as: :text }
  end
end
