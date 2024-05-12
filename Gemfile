# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'rails', '~> 7.0.6'

gem 'bootsnap', require: false
gem 'cocoon'
gem 'devise'
gem 'devise-i18n'
gem 'dockerfile-rails', '>= 1.5', group: :development
gem 'importmap-rails'
gem 'jbuilder'
gem 'meta-tags'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails-i18n', '~> 7.0.0'
gem 'redis', '~> 4.0'
gem 'sentry-rails', '~> 5.11'
gem 'sentry-ruby', '~> 5.11'
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
  gem 'letter_opener_web', '~> 2.0'
  gem 'rubocop-factory_bot', require: false
  gem 'rubocop-fjord', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'slim_lint', require: false
  gem 'web-console'
end
