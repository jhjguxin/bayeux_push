# A connected client
class Client
  # The client_id we assigned
  attr_accessor :client_id

  # Timestamp when we last had activity from this client
  #attr_accessor :lastSeen

  # The EM::Channel on which this client subscribes
  attr_accessor :channel

  # The EM::Subscription a long-poll is currently active
  attr_accessor :subscription

  # Messages queued for this client (an Array)
  attr_accessor :queue

  # Array of channels this client is subscribed to
  attr_accessor :channels

  def initialize(client_id, user_id)     #:nodoc:
    @client_id = client_id
    @user_id = user_id
    @channel = EM::Channel.new
    @queue = []
    @channels = []
  end

  def flush sinatra           #:nodoc:
    queued = @queue
    sinatra.trace "Sending to #{@client_id}: #{queued.inspect}"
    @queue = []

    sinatra.respond(queued)
  end
end
