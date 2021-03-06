
### Get Started

#### generate new app

some tool and post about how generate statra app (with cool structure and tools).

*  [hazel](https://github.com/c7/hazel)(current app used)


   Weasel-Diesel Sinatra app gem, allowing you to generate/update sinatra apps using the Weasel Diesel DSL
*  [Lightweight Web Apps: Getting Started With Sinatra](http://blog.chrisblunt.com/lightweight-web-apps-getting-started-with-sinatra/)
*  [Weasel Diesel Sinatra](https://github.com/mattetti/wd-sinatra)

   Weasel-Diesel Sinatra app gem, allowing you to generate/update sinatra apps using the Weasel Diesel DSL

*  [sinatra-gen](https://github.com/quirkey/sinatra-gen)

   sinatra-gen generates a common file structure and basic app files for a web app utilizing the sinatra framework. For more information on sinatra, check out [sinatrarb.com](http://sinatrarb.com/)

*  [A Simple Blog with Sinatra and Active Record ( + some useful tools)](http://danneu.com/posts/15-a-simple-blog-with-sinatra-and-active-record-some-useful-tools/)

#### generate current app

```shell
hazel faye_push --capistrano --no-database --no-bundle-install
# just because i like mongid better
#hazel -h # display usage for hazel
mkdir wiki
```

change sources of rubygems inside `Gemfile`

### set rvm gemset

```shell
rvm --create --ruby-version use 1.9.3@bayeux_push
rvm --create --versions-conf use 1.9.3@bayeux_push

### expected result

when one user send new message to another one, that user(only this user) should have this received.

    get("/cometd", message = {channel: "/meta/send_message", user_id: "83js73jsh29sjd92", data: { "message_data_json" } })

when one user lose some message last time who should received some messages belone to his.

    get("/cometd", message = {channel: "/meta/messages/unread", user_id: "83js73jsh29sjd92", data: { "message_data_json" } })

should push some message to all users, maybe an pub/sub system

### connect push server from oauth_provider

```ruby
# http://stackoverflow.com/questions/1147557/what-is-the-second-paramenter-of-tcpsocket-send-in-ruby
s = TCPSocket.new('127.0.0.1',8080)
s.send('Hello World',0)
s.close
```

send new message

m = Message.first
send_user = m.send_user
target_user = m.target_user
new_message = {message: {channel: "/meta/server/push_message", user_id: m.target_user.id, data: m.attributes}}
s = TCPSocket.new('127.0.0.1',8080)
s.send(new_message.to_json,0)
s.close

### connect from app or nomarl user

```shell
user = User.first
login = {message: {channel: "/meta/client/login", data: {client_id: "#{SecureRandom.hex}", user_id: user.id}}}
login.to_json

telnet localhost 8080
# login
{"message":{"channel":"/meta/client/login","data":{"client_id":"8d46bb6ce196f90175c446449ecb2361","user_id":"5195ed94d98ca4987d000003"}}}
### resources

*  [eventmachin-getting_started](https://github.com/eventmachine/eventmachine/tree/master/examples/guides/getting_started)
*  [bayeux-rack](https://github.com/cjheath/bayeux-rack)
*  [Simple EventMachine chat server](https://gist.github.com/harmesy/2284810)
*  [Bayeux Protocol](http://svn.cometd.com/trunk/bayeux/bayeux.html)
*  [cometd](https://code.google.com/p/cometd/)
*  [What are Long-Polling, Websockets, Server-Sent Events (SSE) and Comet?](http://stackoverflow.com/questions/11077857/what-are-long-polling-websockets-server-sent-events-sse-and-comet)
*  [cometd-twisted](http://svn.cometd.com/trunk/cometd-twisted) # I wanna have a try but ...
*  [Any success with Sinatra working together with EventMachine WebSockets](http://stackoverflow.com/questions/2999430/any-success-with-sinatra-working-together-with-eventmachine-websockets)
*  [EventMachine实现简单的服务器和客户端](http://lee2013.iteye.com/blog/1041451)
*  [eventmachine](http://eventmachine.rubyforge.org/file.GettingStarted.html)
*  [求教,学习EventMachine时遇到的问题](http://ruby-china.org/topics/1320)
