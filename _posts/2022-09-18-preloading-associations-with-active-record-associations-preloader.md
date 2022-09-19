---
layout: post
title: Preloading associations with ActiveRecord::Associations::Preloader

categories:
- Ruby
- Rails

tags:
- Performance
- SQL
- ORM
- ActiveRecord

description: How I deploy the blog you are reading to Github Pages with Travis CI for free.

---
The other day I was working to reduce the number of N+1 queries for different pages in a rails app.
I found I needed to preload some associations for an object similar to current_user,
so for this example we will just use current user. The current_user helper method 
is defined in the ApplicationController all other controllers that inherit from 
ApplicationController and their views have access to current_user.
Most of the time we don't need associations to be preloaded when working with 
current_user, but sometimes we do. Let's say we want to get all of the 
current_user's posts and all of the comments associated with each of the posts.
If we try to override current_user to use includes it won't work,
we'll get a no method error for includes on the instance of User.
```ruby
# Will raise no method error since .includes is a class methtod
class UserPostsController < ApplicationController
  def index
    @posts = current_user.posts
  end
  
  private

  def current_user
    super.includes(posts: :comments)
  end
end
```

A better way I found is to use [ActiveRecord::Associations::Preloader]. Here we
can pass records and the associations to preload for the
records that were passed. Now there will only be a total of 3 queries for this
page, one for the user, one for the user's posts, and one for the post's comments.

```ruby
class UserPostsController < ApplicationController
  def index
    @posts = current_user.posts
  end

  private

  def current_user
    super.tap do |user|
      ActiveRecord::AssociationsPreloader.new(
        records: Array(user),
        associations: { posts: :comments }
      ).call
    end
  end
end
```
[ActiveRecord::Associations::Preloader]: https://www.rubydoc.info/github/rails/rails/ActiveRecord%2FAssociations%2FPreloader:initialize
