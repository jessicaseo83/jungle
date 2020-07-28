# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server


## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## Screenshots
!["User Logged In Homepage Screenshot"](https://github.com/jessicaseo83/jungle/blob/master/docs/logged_in_home_page.png?raw=true)
!["Cart Screenshot"](https://github.com/jessicaseo83/jungle/blob/master/docs/cart.png?raw=true)
!["Signup page Screenshot"](https://github.com/jessicaseo83/jungle/blob/master/docs/sign_up.png?raw=true)