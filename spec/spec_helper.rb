require 'rspec/core'
require 'rspec/mocks'
require 'nanoc'
require 'nanoc/cli'

RSpec.configure do |config|
  config.mock_with :mocha
end
