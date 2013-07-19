# Omniauth::Braveid

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-braveid'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-braveid

## Usage

First start by adding this gem to your Gemfile:

```ruby
gem 'omniauth-braveid'
```

Next, tell OmniAuth about this provider. For a Rails app, your `config/initializers/omniauth.rb` file should look like this:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :brave_id, "CLIENT_ID", "CLIENT_SECRET", scope: 'basic'
end
```

Replace CLIENT_ID and CLIENT_SECRET with the appropriate values you obtained from https://brave-id.herokuapp.com earlier.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
