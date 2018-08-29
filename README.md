[![Build Status](https://api.travis-ci.org/marcelotoledo5000/deals.svg?branch=master)](https://travis-ci.org/marcelotoledo5000/deals.svg?branch=master)
[![Code Climate](https://codeclimate.com/github/marcelotoledo5000/deals.svg)](https://codeclimate.com/github/marcelotoledo5000/deals)
[![Test Coverage](https://api.codeclimate.com/v1/badges/ee89b0339d22fa938cd5/test_coverage)](https://codeclimate.com/github/marcelotoledo5000/deals/test_coverage)


<h3>This project uses:</h3>

* The Ruby language - version 2.5.1
* The Rails gem - version 5.2
* RSpec: 3.8
* Capybara: 3.6
* Rubocop: 0.58.2
* Postgresql: 10

<h4>System dependencies:</h4>

* Install and configure the database: [Postgresql-10](https://www.postgresql.org/download/)

<h4>To use:</h4>

Clone the project:

<pre>
$ git clone git@github.com:marcelotoledo5000/deals.git
$ cd deals
$ bundle install
$ rails db:setup
$ rails db:migrate
</pre>

<h4>To run the tests</h4>

<pre>
$ bundle exec rspec
</pre>

<h4>To run app</h4>

To check that application runs properly by entering the command:

<pre>
$ rails server
</pre>

To see the application in action, open a browser window and navigate to [http://localhost:3000/](http://localhost:3000.)

You should see a home page with a "log in" or "sign up" form.

<h4>Deploy to Heroku</h4>

* Make a free account on [Heroku](https://www.heroku.com/)
* Install [HerokuCli](https://devcenter.heroku.com/articles/heroku-cli)

From the Command Line, and in the project folder:

<pre>
$ heroku login
$ heroku apps:create mydeals
$ heroku run gem install bundler
$ git push heroku master
$ heroku run rake db:migrate
$ heroku open
</pre>
