# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'rails', '~> 7.0.6'

gem 'sprockets-rails'

gem 'pg', '~> 1.1'

gem 'puma', '~> 5.0'

gem 'importmap-rails'

gem 'turbo-rails'

gem 'stimulus-rails'

gem 'tailwindcss-rails'

gem 'jbuilder'

gem 'redis', '~> 4.0'

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'bootsnap', require: false

group :development, :test do
  gem 'capybara'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console'

  gem 'letter_opener_web', '~> 2.0'
  gem 'rubocop-factory_bot', require: false
  gem 'rubocop-fjord', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'slim_lint', require: false
end

gem 'cocoon'
gem 'devise'
gem 'devise-i18n'
gem 'dockerfile-rails', '>= 1.5', group: :development
gem 'meta-tags'
gem 'rails-i18n', '~> 7.0.0'
gem 'sentry-rails', '~> 5.11'
gem 'sentry-ruby', '~> 5.11'
gem 'slim-rails'
