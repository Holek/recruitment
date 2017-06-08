require 'json'
require 'sequel'
require 'sinatra/base'
require 'sinatra/json'

DB = Sequel.sqlite

class Webhook < Sinatra::Base
  post '/webhook' do
    # ...
    json saved: 0
  end

  helpers do
    def posted_json
      request.body.rewind # in case someone already read it
      JSON.parse(request.body.read)
    end
  end
end
