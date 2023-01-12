# README

This is a small demo e-commerce app using Rails 7, Stimulus and Tailwind. 

From the home page a user can add an item to a list of favourites via a js action by clicking the star icon in the corner of that item's image. The favourites list can be accessed via the dropdown menu from the burger icon.

Clicking an item's image on the home page will direct a user to the item's information page. From here a quantity of the item can be added to the shopping cart via a js action. Additional js actions will also update the colour and number of the shopping cart icon in the header.

* Ruby version

Ruby 3.1.2 & Rails 7.0.4

* System dependencies

PostgreSQL 14.5

* Configuration

Clone the repo and run `$ bundle` to install packages

* Database creation

Ensure Postgres is running and run the command `$ bundle exec rails db:create`

* Database initialization

`$ bundle exec rails db:seed`

* How to run the test suite

`$ bundle exec rspec`

* How to run the project

`$ bundle exec rails s` or `$ ./bin/dev\`
Navigate to `http://localhost:3000/` 

