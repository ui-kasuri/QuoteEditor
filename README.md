# Installation


This gem is automatically configured for applications made with Rails 7+ (unless --skip-hotwire is passed to the generator). But if you're on Rails 6, you can install it manually:

* Add the turbo-rails gem to your Gemfile: gem 'turbo-rails'
* Run ```bash ./bin/bundle install```
* Run ```bash./bin/rails turbo:install ```
* Run ```bash ./bin/rails turbo:install:redis ``` to change the development Action Cable adapter from Async (the default one) to Redis. The Async adapter does not support Turbo Stream broadcasting.

Running ```bash  turbo:install``` will install through NPM if Node.js is used in the application. Otherwise the asset pipeline version is used. To use the asset pipeline version, you must have importmap-rails installed first and listed higher in the Gemfile.
