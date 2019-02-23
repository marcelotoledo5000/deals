FROM ruby:2.6.0

LABEL name="Debian-Ruby-2.6-NodeJS" \
      version="1.0"

RUN apt-get update -y \
    && gem update --system \
    && gem install bundler \
    && apt-get install curl software-properties-common -y \
    && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install apt-utils nodejs -y
