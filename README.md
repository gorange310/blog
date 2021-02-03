# Alpha Blog
This is a blog app\
I'm currently a Ruby/Rails app developer, this is my personal project when I was learn from Udemy Course: the-complete-ruby-on-rails-developer-course.


I followed RESTful conventions for my routes but since I was only utilizing certain functions, I added limitations to them.\
Users can only be showed.\
Stcoks can only be updated.\
It isn't full CRUD but enough to implement the user stories required. There’s also room to expand in the future to for the other CRUD features.


I expanded model: Comment, and RESTful for the routes. Guest can sign up and post the comment on each post.



## 1 Development tools

* Ruby 2.6.6

* Rails 6.0.3.4

* PostgreSQL

* User System
  - Active Model has_secure_password: gem 'bcrypt', '~> 3.1.7'
  - SessionsController, model User

* Layout: gem 'will_paginate', '~> 3.1.0'

* Development test: gem 'foreman', '~> 0.87.2'

* Gravatar Helper Method:
  - Digest::MD5.hexdigest
  - "https://www.gravatar.com/avatar/#{hash}?s=#{size}"


## 2 Installation

* git clone https://github.com/gorange310/test_rails.git rails-folder
* cd rails-folder
* bundle install
* rails db:migrate
* rails s


## 3 The Production Deployment server: Heroku

  http://orange-finance-tracker.herokuapp.com/
  
  
## 4 table schema
![Untitled (2)](https://user-images.githubusercontent.com/44969245/106624234-6484b400-65b0-11eb-8bd1-f105206e9822.png)
