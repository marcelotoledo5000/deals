# **DEALS**

[![codebeat badge][codebeat-badge]][codebeat] [![Coverage][codecov-badge]][codecov] [![Ruby Build][actions-badge]][actions]

## About this project

The proposal of this project is to enable the user to control and follow up on
their commercial goals, defined for each of their clients.

To run on Heroku, [access here](https://mydeals.herokuapp.com/)

## Technical Informations and dependencies

``` code
* The Ruby language   # version 3.0.2
* The Rails gem       # version 6.1
* Capybara:           # version 3.36
* RSpec-Rails         # version 5.0.2
* Rubocop             # version 1.22.3
* PostgreSQL          # version 10
* Docker              # version 20.10.9
* Docker Compose      # version 2.0.1
```

## To use

Clone the project:

``` Shell
git clone git@github.com:marcelotoledo5000/deals.git
cd deals
```

### With Docker (better option)

``` Shell
script/setup    # => development bootstrap, preparing containers
script/server   # => starts server
script/console  # => starts console
script/test     # => running tests
```

#### Running without Docker (not recommended!)

If you prefer, you'll need to update `config/database.yml`:

``` Yaml
# host: db        # when using docker
host: localhost   # when using localhost
```

System dependencies

* Install and configure the database: [Postgresql-10](https://www.postgresql.org/download/)

And then:

``` Shell
gem install bundler         # => install the last Bundler version
bundle install              # => install the project's gems
rails webpacker:install     # => configure webpacker
rails db:setup db:migrate   # => prepare the database
rails s                     # => starts server
rails c                     # => starts console
bundle exec rspec           # => to running tests
```

### To run app

To see the application in action, starts the rails server to able [http://localhost:3000/](http://localhost:3000.)

You should see a home page with a "log in" or "sign up" form.

### Dockerfile

[Dockerfile is here](https://github.com/marcelotoledo5000/Dockerfiles)

### Deploy to Heroku

* Make a free account on [Heroku](https://www.heroku.com/)
* Install [HerokuCli](https://devcenter.heroku.com/articles/heroku-cli)
* To run on Heroku, [access here](https://mydeals.herokuapp.com/)

From the Command Line, and in the project folder:

``` bash
heroku login
heroku apps:create mydeals
heroku run gem install bundler
git push heroku master
heroku run rake db:migrate
heroku open
```

#### Pending actions

* Fix pending scenarios
* Connection with Pipedrive API
* Set a layout using Bootstrap
* Set the following gems:
  * Pundit
  * Kaminari

[codebeat-badge]: https://codebeat.co/badges/79b5a436-3241-4d15-b961-04c6fddc6001
[codebeat]: https://codebeat.co/projects/github-com-marcelotoledo5000-deals-master

[codecov-badge]: https://codecov.io/gh/marcelotoledo5000/deals/branch/master/graph/badge.svg
[codecov]: https://codecov.io/gh/marcelotoledo5000/deals

[actions-badge]: https://github.com/marcelotoledo5000/deals/actions/workflows/ruby.yml/badge.svg
[actions]: https://github.com/marcelotoledo5000/deals/actions/workflows/ruby.yml
