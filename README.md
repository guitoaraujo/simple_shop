# README

## Requirements

* Ruby 3.0.1
* Rails 7.0.8
* Postgresql

## Bundle

* run `bundle install`
* run `rails db:create db:migrate db:seed`
* run `rails server`
* access `localhost:3000`

## Tests

* run `bundle exec rspec` for all tests
* run `bundle exec rspec [path]` for a specific test

## Explanations

I tried to create a model for conditions and link it to product, but it did not go well due to complexity.
So in the end I decided to create modules for the initial three conditions we have, they are flexible in terms of parameters and we can create more modules for new conditions.

I followed most of Rubocop suggestions.
There are tests implemented using RSpec.

There is something that I like to refactor first: loops.


