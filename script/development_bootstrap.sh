#!/bin/bash
echo "Installing bundler"
gem install bundler

echo "Installing gems"
bundle install --jobs=$(nproc)

echo "Creating databases"
rails db:reset db:migrate
rails db:test:prepare
