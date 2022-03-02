![CI status](https://github.com/LichieLich/rails-project-lvl1/actions/workflows/main.yml/badge.svg)
![CI status](https://github.com/LichieLich/rails-project-lvl1/actions/workflows/hexlet-check.yml/badge.svg)
# HexletCode

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/hexlet_code`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hexlet_code'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install hexlet_code

## Usage

To create a simple tag just run:
For single tag
```ruby
HexletCode::Tag.build('input', type: 'submit', value: 'Save') # <input type="submit" value="Save">
```
For pair tag add content as a block
```ruby
HexletCode::Tag.build('label', for: 'email') { 'Email' } # <label for="email">Email</label>
```

To create a form with nested tags for some user run
```ruby
User = Struct.new(:name, :job, keyword_init: true)
@user = User.new name: 'rob', job: 'hexlet'
HexletCode.form_for(@user) do |f|
  f.input :name
  f.input :job, as: :text
end
# <form action="#" method="post">
#   <input name="name" type="text" value="rob">
#   <textarea cols="20" rows="40" name="job">hexlet</textarea>
# </form>
```
Option ```ruby
as: :text``` creates textarea tag for attribute.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/hexlet_code.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
