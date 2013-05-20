class Connection < EventMachine::Connection
  attr_accessor :server
  attr_reader :client_id

  def initialize
  end

  # ask client to set client info
  def post_init()
    send_data("Hi, please enter client info: ")
  end

  # client_info
  def receive_data(message)
    message.strip!
    begin
    message = JSON.parse(message)
    rescue => error
      send_data "#{error.message}, when parse '#{message}' to json"
      return
    end

    data = message["message"]["data"]
    channel = message["message"]["channel"]
    
    if data.blank? or channel.blank?
      send_data "data or channel is require"
      return
    end


    case channel
      when /meta\/server\//
        puts "from server no need login"
        #client_to_client
      when /meta\/client\//
        puts "from client"
        unless @client_id
          handle_login(data)
        else
          handle_message(data)
        end
      end
  end

  def unbind
    @server.connections.each { |connection| connection.send_data("#{@client_id} has just left\n") }
    @server.connections.delete(self)
  end

  private

  # client_info = {client_id: "#{SecureRandom.hex}", user_id: User.first.id}.to_json
  # client input `puts client_info`
  # client_info= {"client_id":"170d82adcb47eda0936c0dc93ebd4476","user_id":"5195ed94d98ca4987d000003"}
  def handle_login(client_info)

    client_id, user_id = client_info["client_id"], client_info["user_id"]

    if @server.has_client_id? client_id
      send_data("Sorry, that client_id has already been taken. Please choose another: ")
      return
    end

    send_data("Hello #{client_id}\n")

    others = @server.connections

    if others.count > 0
      send_data("There are #{@server.connections.count} other people chatting at the moment\n")

    else
      send_data("There's nobody else here right now!\n")
    end

    send_data("-------------------------------------------------------------------------------------\n")
    @client_id = client_id
    @user_id = user_id
    # @server.connections.each { |connection| connection.send_data("#{@client_id} has just joined\n") }
    @server.connections << self
  end

  def handle_message(message)
    message = {data: message}.to_json
    @server.connections.each { |connection| connection.send_data(message) unless connection == self }
  end
end
