require_relative "spec_helper"
require_relative "../bayeux_push.rb"

def app
  BayeuxPush
end

describe BayeuxPush do
  it "responds with a welcome message" do
    get '/'

    last_response.body.must_include 'Welcome to the Sinatra Template!'
  end
end
