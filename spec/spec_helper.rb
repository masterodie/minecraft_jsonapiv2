require 'rubygems'
require 'minecraft_jsonapiv2'

require 'minitest/autorun'
require 'minitest/spec'

if __FILE__ == $0
  $LOAD_PATH.unshift('lib', 'spec')
  Dir.glob('./spec/**/*_spec.rb') { |f| require f }
end
