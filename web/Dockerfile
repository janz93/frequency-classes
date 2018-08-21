FROM ruby:2.4.0-alpine

RUN \
  apk update && \
  apk add nodejs build-base libxml2-dev libxslt-dev && \
  apk --no-cache add mariadb-dev mysql-client && \
  rm -rf /var/cache/apk/*

# Copy helper scripts
COPY docker/* /usr/bin/

RUN mkdir /app
WORKDIR /app

COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock

RUN bundle install -j 20
COPY . .

ENTRYPOINT ["/usr/bin/entrypoint"]
CMD ["bundle exec hanami server --host 0.0.0.0"]
