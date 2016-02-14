FROM ruby:2.2.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /notekeeper
WORKDIR /notekeeper
ADD Gemfile /notekeeper/Gemfile
ADD Gemfile.lock /notekeeper/Gemfile.lock
RUN bundle install
ADD . /notekeeper
