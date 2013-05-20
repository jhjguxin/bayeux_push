class Server
  attr_accessor :connections, :domain

  def initialize
    @connections = []
  end

  def start(domain = {:host => '0.0.0.0', :port => 8080})
    host, port = domain[:host], domain[:port]
    @signature = EventMachine.start_server(host, port, Connection) do |con|
      con.server = self
    end
  end

  def stop
    EventMachine.stop_server(@signature)

    unless wait_for_connections_and_stop
      EventMachine.add_periodic_timer(1) { wait_for_connections_and_stop }
    end
  end

  def has_client_id?(client_id)
    @connections.detect { |connection| connection.client_id == client_id }
  end

  private

  def wait_for_connections_and_stop
    if @connections.empty?
      EventMachine.stop
      true
    else
      puts "Waiting for #{@connections.size} connection(s) to stop"
      false
    end
  end
end
