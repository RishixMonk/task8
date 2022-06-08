FROM ruby:3.0.4 

ENV RAILS_ROOT /project


RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list


RUN apt-get update && \
  apt-get install -y \
  build-essential \
  nodejs \
  yarn \
  libpq-dev && \
  apt-get clean autoclean && \
  apt-get autoremove -y && \
  rm -rf /var/lib/apt /var/lib/dpkg /var/lib/cache /var/lib/log

WORKDIR /app

ENV RAILS_ENV='development'
# ENV RAILS_ENV='production'
# ENV SECRET_KEY_BASE='9f3fb419a4d0afe5c256156a2075cc91b135e273ea28e67ecc747eb8f164162239c4bcf6fb7b518ea0695f806092d1cb6499ca0aa58874ec0b7149d0df2bac03'
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN gem install bundler 
RUN bundle install --without production test

COPY package.json package.json
COPY yarn.lock yarn.lock

#RUN yarn install --check-files

COPY . /app
RUN rm -f tmp/pids/server.pid 

# # RUN bundle exec rails assets:precompile
# ENTRYPOINT ["bin/rails"]

# CMD ["s","-b","0.0.0.0"]

# EXPOSE 3000

# EXPOSE 3000

CMD ["bundle", "exec", "rails", "s","-b","0.0.0.0"]
