# Rails Project Bootstap environment
### Base Image ###
FROM ruby:2.6.7-slim

### Builder Stage ###
## Install Debian Slim Rails Build Package Requirements
# Install Build Tools (glibc) & MIME (DB) Info & Postgresql & Node
#  (-y for no user prompt) 
RUN apt update && apt install -y build-essential \
  shared-mime-info \
  postgresql postgresql-contrib libpq-dev \
  nodejs \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

## Install Base Gems
# Use the same version of Bundler as the Rails Version?
RUN gem install bundler:2.2.19 rails:5.2.4.6

WORKDIR /app

### Dev Environment ###
# ASSUME source is docker volumed into the image
# Add git and vim at least
# Note for this Bootstrap, I am eating the additional layer
# of the RUN command to show only needed for dev
RUN apt update && apt install -y git vim

# Do the Rails New in the Container to Build the desired project
# with postgresql as DB and no unit test
CMD ./rails-new-pg-rspec-project
#CMD bash