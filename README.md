Rack::PublishExceptions
=======================

**Rack::PublishExceptions** is a Rack middleware that captures all exceptions on the app and process them on a pre-determined manner.
We created it to send all exception data to a Redis' channel, but it can be used in many other ways, such as emailing exceptions and so on.

Installing
----------

Add this on your `Gemfile`:

```ruby
gem 'rack-publish-exceptions'
```

And this on your `config.ru`, right before the `run` line of your app:

```ruby
Rack::PublishExceptions.config do |c|
  c.publisher = MyPublisher.new # Or any other object
  c.format = proc do |environment, exception|
    { :exception => exception.class.to_s }.to_json
  end
end

use Rack::PublishExceptions
```

On the `config` block, it accepts two options, `publisher` and `format`. The `publisher` is an object that respond to the `#publish` method, with one argument for the message. The `format`, on the other hand, is any kind of object that respond to a `#call` method with two arguments (a proc/lambda is the safe choice here). The arguments it receives are the environment and the exception, respectively.

Known Issues
------------
* As for now, it doesn't work on Sinatra and other Rack Framework that captures exceptions.

Notes on Patches/Pull Requests
------------------------------

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so we won't break it in a future version unintentionally.
* Commit, do not mess with rakefile, version, or history. (if you want to have your own version, that is fine but bump version in a commit by itself we can ignore when we pull)
* Send me a pull request. Bonus points for topic branches.
