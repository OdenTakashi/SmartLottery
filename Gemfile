# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.7'

gem 'rails', '8.0.1'

gem 'bootsnap', require: false
gem 'cocoon'
gem 'devise'
gem 'devise-i18n'
gem 'importmap-rails'
gem 'jbuilder'
gem 'meta-tags'
gem 'pg'
gem 'puma'
gem 'rails-i18n'
gem 'redis'
gem 'sentry-rails'
gem 'sentry-ruby'
gem 'slim-rails'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'tailwindcss-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'capybara'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
end

group :development do
  gem 'dockerfile-rails'
  gem 'letter_opener_web'
  gem 'rubocop-capybara'
  gem 'rubocop-factory_bot', require: false
  gem 'rubocop-fjord', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'slim_lint', require: false
  gem 'web-console'
end
