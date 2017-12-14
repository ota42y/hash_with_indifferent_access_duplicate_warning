# HashWithIndifferentAccessDuplicateWarning

The ruby allow different value between string key and symbol key.

```
{x: 21, 'x'=>42}
=> {:x=>21, "x"=>42}
```
But, when we convert this hash to HashWithIndifferentAccess, we lost one side value.

```
ActiveSupport::HashWithIndifferentAccess.new({x: 21, 'x'=>42})
=> {"x"=>42}
```

When we create duplicate key's hash, ruby warning message.

```
irb(main):010:0> {x: 21, 'x':42}
(irb):10: warning: key :x is duplicated and overwritten on line 10
=> {:x=>42}
```

This gem show warning message when HashWithIndifferentAccess overwritten a key.

```
ActiveSupport::HashWithIndifferentAccess.new({x: 21, 'x'=>42})
warning: key :x and 'x' is duplicated and overwritten
=> {"x"=>42}
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hash_with_indifferent_access_duplicate_warning'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hash_with_indifferent_access_duplicate_warning

## Usage

```
require 'hash_with_indifferent_access_duplicate_warning'

# set logger proc
log_proc = proc { |msg| p msg }
HashWithIndifferentAccessDuplicateWarning.register_write_error_log_func(log_proc)

# create
ActiveSupport::HashWithIndifferentAccess.new({x: 21, 'x'=>42})
=> {"x"=>42}
# output message like "warning: key :x and 'x' is duplicated and overwritten"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/hash_with_indifferent_access_duplicate_warning. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HashWithIndifferentAccessDuplicateWarning project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/hash_with_indifferent_access_duplicate_warning/blob/master/CODE_OF_CONDUCT.md).
