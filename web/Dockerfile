FROM ruby:2.4.0-alpine

RUN \
  # update packages
  apk update && \

  apk add nodejs build-base libxml2-dev libxslt-dev && \

  # gem 'mysql2'
  apk --no-cache add mysql-dev && \

  # clear after installation
rm -rf /var/cache/apk/*


RUN mkdir /app
WORKDIR /app

COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock

RUN bundle install -j 20
COPY . .