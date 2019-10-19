FROM ruby:2.6.5

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -

RUN apt-get update && apt-get install -y \
    netcat \
    build-essential \
    nodejs \
    npm

RUN gem install bundler -v '2.0.2'

RUN npm install -g yarn

WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install --jobs 4

ADD . /opt/app
WORKDIR /opt/app

ENV PATH "/opt/app/bin:$PATH"

RUN yarn install
RUN SECRET_KEY_BASE=`rake secret` \
    RAILS_ENV=production \
    bundle exec rails assets:precompile
