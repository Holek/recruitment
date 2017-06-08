require 'database_cleaner'
require 'json'
require 'rack/test'
require 'rspec'

ENV['RACK_ENV'] ||= 'test'

require_relative '../webhook'

DatabaseCleaner.strategy = :truncation

module RSpecMixin
  include Rack::Test::Methods

  def app
    Webhook
  end

  def post_json(uri, jsonable)
    post(uri, jsonable.to_json, {"CONTENT_TYPE" => "application/json"})
  end

  def last_json
    JSON.parse(last_response.body)
  end
end

RSpec.configure do |c|
  c.include RSpecMixin
  # Make tests order-dependent and fail-fast for interview purposes
  c.fail_fast = 1
  c.register_ordering(:global) { |items| items }
  c.before(:suite) do
    DatabaseCleaner.clean
  end
end
