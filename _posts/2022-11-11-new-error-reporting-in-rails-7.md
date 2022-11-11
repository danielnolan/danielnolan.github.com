---
layout: post
title: New error reporting in rails 7

categories:
- Ruby
- Rails

tags:
- error handling
- exceptions
- sentry
- honeybadger

description: Checking out the new error reporting that was added in rails 7

---
While working through a bug where we were getting duplicate errors reported by
sidekiq in honeybadger I learned about a new feature that was released in rails
7, but wasn't documented. Have you ever written some code like this example below 
where you want to rescue an exception and still report to your error 
reporting service like honeybadger or sentry? 

``` ruby
begin
  do_something
rescue SomethingIsBroken => error
  MyErrorReportingService.notify(error)
end
```

Well a new feature was added in rails called Error Reporting, and now we have a
simple consistent way of doing this in rails. 

``` ruby
Rails.error.handle(SomethingIsBroken) do
  do_something
end
```

The code above will handle the error if `do_something` raises an error and rails 
will automagically send it to the reporting service you are using in your app.
To create a subscriber for the error reporting you just create an intializer
like this. As of now honeybadger and sentry both create a subscriber for you so
you can skip this if you use either of them.
``` ruby
# config/initializers/error_subscriber.rb
class ErrorSubscriber
  def report(error, handled:, severity:, context:, source: nil)
    MyErrorReportingService.report_error(error, context: context, handled: handled, level: severity)
  end
end

Rails.error.subscribe(ErrorSubscriber.new)
```

Thats it, now you can use the consistent `Rails.error.handle` block when
handling errors in your app while still being able to be notified of those
errors in your error reporting tool of choice. 

As of now both sentry and honeybadger both work with this on rails 7 and newer
apps. It will be in the docs for the next release of rails also. Check out the 
[rails error reporting docs].

[rails error reporting docs]: https://edgeguides.rubyonrails.org/error_reporting.html
https://edgeguides.rubyonrails.org/error_reporting.html
