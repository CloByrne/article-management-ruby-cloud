FROM ruby:2.7.3

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

CMD ["rails", "server", "-b", "0.0.0.0"]
