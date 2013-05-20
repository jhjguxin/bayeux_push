
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

### connect push server

    module ClientPost
        def post_init
          send_data "GET /\r\n\r\n"
          @data = ""
        end

        def receive_data(data)
          @data << data
        end

        def unbind
          if @data =~ /[\n][\r]*[\n]/m
            $`.each {|line| puts ">>> #{line}" }
          end

          EventMachine::stop_event_loop
        end
    end

    EventMachine.run {
      EventMachine.connect '127.0.0.1', 8081, ClientPost
    }

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
