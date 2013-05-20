
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
```

### expected result

when one user send new message to another one, that user(only this user) should have this received.

    get("/cometd", message = {channel: "/meta/send_message", client_id: "83js73jsh29sjd92",id: "#{SecureRandom.hex}" , data: { "message_data_json" } })

when one user lose some message last time who should received some messages belone to his.

    get("/cometd", message = {channel: "/meta/messages/unread", client_id: "83js73jsh29sjd92", id: "#{SecureRandom.hex}", data: { "message_data_json" } })

should push some message to all users, maybe an pub/sub system


### message test

m.attributes
 => {"_id"=>"5195ede0d98ca4987d000005", "send_user_id"=>"5195ed94d98ca4987d000003", "target_user_id"=>"5195ed9ad98ca4987d000004", "content"=>"2134123412341234", "message_sequence"=>3, "updated_at"=>2013-05-17 08:44:16 UTC, "created_at"=>2013-05-17 08:44:16 UTC, "received"=>"0", "readed"=>"0", "deleted"=>"0"}

m = Message.first
send_user = m.send_user
target_user = m.target_user
action_wrap = Http::ActionWrap.new({url: "http://localhost:3000"})

app.root_url(message: param,host: "localhost:3000")

# target user is online
connect = {message: {channel: "/meta/connect", id: "#{SecureRandom.hex}", client_id: m.send_user.id, connectionType: 'long-polling', data: {}}}
helper.add_params_to_url("http://localhost:3000","/cometd", connect)

handshake = {message: {channel: "/meta/handshake", id: "#{SecureRandom.hex}", client_id: m.send_user.id, connectionType: 'long-polling', data: {}}}
helper.add_params_to_url("http://localhost:3000","/cometd", handshake)


### resources

*  [eventmachin-getting_started](https://github.com/eventmachine/eventmachine/tree/master/examples/guides/getting_started)
*  [bayeux-rack](https://github.com/cjheath/bayeux-rack)
*  [Simple EventMachine chat server](https://gist.github.com/harmesy/2284810)
*  [Bayeux Protocol](http://svn.cometd.com/trunk/bayeux/bayeux.html)
*  [cometd](https://code.google.com/p/cometd/)
*  [What are Long-Polling, Websockets, Server-Sent Events (SSE) and Comet?](http://stackoverflow.com/questions/11077857/what-are-long-polling-websockets-server-sent-events-sse-and-comet)
*  [cometd-twisted](http://svn.cometd.com/trunk/cometd-twisted) # I wanna have a try but ...
