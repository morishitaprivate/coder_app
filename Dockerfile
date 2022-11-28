FROM ruby:2.7.6
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /coder
WORKDIR /coder

COPY Gemfile /coder/Gemfile
COPY Gemfile.lock /coder/Gemfile.lock

RUN bundle install
COPY . /coder