FROM ruby:2.7-alpine

ENV PAGES_REPO_NWO="doesnt/matter"

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN apk add --no-cache make g++ && bundle config --global frozen 1 && bundle install

CMD ["bundle", "exec", "jekyll", "serve"]
