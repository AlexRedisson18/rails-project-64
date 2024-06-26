# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.2'

gem 'bootsnap', require: false
gem 'cssbundling-rails'
gem 'jbuilder'
gem 'jsbundling-rails'
gem 'puma', '>= 5.0'
gem 'rails', '~> 7.1.3', '>= 7.1.3.2'
gem 'redis', '>= 4.0.1'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[windows jruby]

gem 'ancestry'
gem 'devise'
gem 'rails-i18n'
gem 'rubocop-rails', require: false
gem 'sentry-rails'
gem 'sentry-ruby'
gem 'simple_form'
gem 'slim_lint'
gem 'slim-rails'

group :development, :test do
  gem 'debug', platforms: %i[mri windows]
  gem 'sqlite3'
end

group :development do
  gem 'i18n-debug'
  gem 'rubocop', '~> 1.21'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'faker'
  gem 'minitest-power_assert'
  gem 'selenium-webdriver'
end

group :production do
  gem 'pg'
end
