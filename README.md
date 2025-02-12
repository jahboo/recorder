# Recorder

Recorder tracks changes of your Rails models

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'recorder'
```

And then execute:

$ bundle

Or install it yourself as:

$ gem install recorder

Then, in your project directory:

$ rails generate recorder:install --with_number_column --with_index_by_user_id

## Usage

Just add in model:

```ruby
include ::Recorder::Observer
```

Add in controller:

```ruby
include Recorder::Rails::ControllerConcern
```

Also, you can specify options in model like:

```ruby
recorder async: true, ignore: [:created_at, :updated_at]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jetrockets/recorder.

## Credits

![JetRockets](http://jetrockets.pro/jetrockets-white.png)

Recorder is maintained by [JetRockets](http://www.jetrockets.ru).

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
