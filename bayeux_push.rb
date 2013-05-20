EventMachine::run do
  domain = {:host => '0.0.0.0', :port => 8080}
  s = Server.new
  s.start(domain)
  puts "Server listening #{domain}"

end
