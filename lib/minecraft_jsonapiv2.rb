require 'json'
require 'digest/sha2'
require 'httparty'
require 'yaml'
require 'mash'


module Minecraft
    module JSONAPIv2
        BASE_URI = 'http://%{host}:%{port}/api/2/call'

        Dir[File.join(File.dirname(__FILE__),  '**', '*.rb')].each { |f| require f }

        def self.new(options={})
            Minecraft::JSONAPIv2::API.new(options)
        end
    end
end
