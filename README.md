# Proof of Concept - Containerized New PostgreSQL, RSpec Rails Project Generator

## What Is This
This is a quick and dirty, proof of concept new Rails Project Generator with PostgreSQL as the database and RSpec as the test framework.  This generator runs in a container and the target directory (actually the directory containing these files) is mounted in so that the container
mutates your local filesystem (i.e. builds the rails project on your local machine).

## Current Limitations
Currently this is hardcoded to generate a Rails 5.2.4.6/Ruby 2.6.7 project called `pgblog`.

It is assumed that the base image of this Rails project would be the same as the generator (ruby:2.6.7-slim).  

Note that only the Rails project source files are considered persistent and that natively-compiled dependencies (gems) are ephemeral along with the genertor container.  

**This script is not idempotent** and has no error-checking.

## How to Run the Generator
You will need Docker installed and running on your local machine.

From the directory containing these files...
  1. Run the following command to build the generator image  
  `docker build --no-cache -t railsgen .`
  2. Run the following command to run the generator against this current directory  
  `docker run -it --rm -v $(pwd):/app railsgen`

  This will create the rails project `pgblog` as a subdirectory of the current directory.