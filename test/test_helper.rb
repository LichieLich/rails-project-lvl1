# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'hexlet_code'

require 'minitest/autorun'

User = Struct.new(:name, :job, keyword_init: true)

def get_html(name)
  File.read("./test/fixture/files/#{name}.html")
end
