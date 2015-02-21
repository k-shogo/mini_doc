FROM ruby:2.2.0

RUN apt-get update && apt-get install -y nodejs mysql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN bundle install -j4 --without development test

COPY . /usr/src/app

EXPOSE 3000
# CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]
CMD ["bundle", "exec", "unicorn", "-c", "config/unicorn.rb"]
