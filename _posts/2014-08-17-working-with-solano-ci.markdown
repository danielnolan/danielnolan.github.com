---
layout: post
title: Solano CI Intermittent Failed Builds With Capybara

categories:
- Ruby
- Testing

tags:
- Continuous Integration
- Rspec
- Capybara
- Rails
- Solano
- Testing

description: A tip I have learned about Solano CI builds intermittently failing when testing with Rspec and Capybara.

---
My company has been using Solano CI (formerly Tddium) for Continuous Integration
and Rspec/Capybara for testing our Rails apps. We have Solano CI linked to Github, whenever
we push a branch or a new commit to a branch, it kicks off a build on Solano CI and runs
all of the Rspec/Capybara specs. When I first started on this project, we were
always having problems with builds intermittently failing. However, these specs would
pass every time when running Rspec locally. A CI server is not a useful tool if it&#39;s
not reliable. I began to look into what was causing these intermittently failing builds
and I noticed that all of the failures were coming from feature specs. Since feature specs are 
handled by Capybara, I figured the failures had something to do with the way Capybara
was running on Solano CI.
After some digging and a conversation with Solano support, we were able to get the
intermittently failing builds to stop. The tests are run in parallel on Solano CI for speed,
sometimes the 2 second Capybara default wait time was not long enough. Most of
the time the builds would pass, but sometimes the content or element wasn&#39;t on the page within
the 2 seconds time causing the feature spec to fail. We changed the value from 2 seconds
to 8 seconds and kicked off a few builds. Every build that passes locally is now passing
without any issues on Solano CI. In the code example below the Capybara default wait
time is only adjusted if the ENV is set to TDDIUM.
If you need to adjust the Capybara default wait time because of intermittently
failing Capybara feature specs, just add this to your spec_helper.rb or
rails_helper.rb if you are using Rspec 3.

{% highlight ruby %}
if ENV['TDDIUM'] #only set this config on Solano CI
  #set longer capybara wait time to prevent failed builds on SolanoCI
  Capybara.default_wait_time = 8
end
{% endhighlight %}
