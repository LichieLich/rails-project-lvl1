# frozen_string_literal: true

require 'test_helper'

class HexletCodeTest < Minitest::Test
  def setup
    @user = User.new name: 'rob', job: 'hexlet'
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_it_raises_no_method_error
    assert_raises(NoMethodError) do
      HexletCode.form_for(@user, url: '/users') { |f| f.input :age }
    end
  end

  def test_it_generates_input_in_form
    assert_equal get_html('simple_input'), HexletCode.form_for(@user) { |f| f.input :name }
  end

  def test_it_generates_form_with_submit_default_name
    actual = HexletCode.form_for(@user) do |f|
      f.input :name
      f.input :job, as: :text
      f.submit
    end
    assert_equal get_html('form_with_submit_default_name'), actual
  end

  def test_it_generates_input_in_form_as_text_with_custom_size
    actual = HexletCode.form_for(@user) do |f|
      f.input :name, class: 'user-input'
      f.input :job, as: :text, rows: 50, cols: 60
      f.submit 'Submit'
    end
    assert_equal get_html('as_text_custom_size'), actual
  end
end
