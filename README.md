# Minecraft JSONAPIv2

A ruby API wrapper for the [JSONAPI Plugin](http://mcjsonapi.com/) for Minecraft

## Installation

Add this line to your application's Gemfile:

    gem 'minecraft_jsonapiv2'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install minecraft_jsonapiv2

## Usage

```ruby
require 'minecraft_jsonapiv2'

api = Minecraft::JSONAPIv2.new(host: '127.0.0.1', port: 20059, user: 'admin', password: 'changme', salt: 'mmm')

#Call a non namespaced method
api.server

#Replace dots with underscores in namespaced method names
api.server_version

#If the method name itself contains underscores call it as a block
api.worlds_world do |world|
  world.save_off
end

#Call a method with arguments
chat_broadcast('Hello World')

#Call a method with arguments in a block
api.worlds_world do |world|
  world.set_time('world', 6000)
end

#Or call a method manally
options = {
  name: 'worlds.world.set_time'
  args: ['world', 6000]
}
api.call(options)

```

See [JSONAPI Method Documentation](http://mcjsonapi.com/apidocs/) for more information

## Contributing

1. Fork it ( https://github.com/masterodie/minecraft_jsonapiv2/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
