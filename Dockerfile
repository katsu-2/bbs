FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs mysql-client
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp
CMD ["rails", "server", "-b", "0.0.0.0"]
