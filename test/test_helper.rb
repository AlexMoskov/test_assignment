if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start do
    add_filter 'test'
    command_name 'Mintest'
    coverage_dir 'test/coverage'
  end
end

require 'minitest/autorun'
require 'vcr'
require "minitest/reporters"
require_relative '../number_client/base'

VCR.configure do |config|
  config.cassette_library_dir = "test/fixtures/vcr_cassettes"
  config.hook_into :webmock # or :fakeweb
end

Minitest::Reporters.use!
