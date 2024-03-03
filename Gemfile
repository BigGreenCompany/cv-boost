source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "letter_opener"
  gem "web-console"
  gem "rack-mini-profiler", require: false
  gem "solargraph"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem "rails", "~> 7.1", ">= 7.1.3.2"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 6.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "redis", "~> 4.0"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem "devise", "~> 4.9"
gem "bootstrap", "5.3.1"
gem 'sass-rails', '~> 6.0'
gem 'actiontext', require: 'action_text'
gem "ruby-openai", "~> 6.3", ">= 6.3.1"
gem "faker"
gem "redcarpet", "~> 3.6"
gem "ahoy_matey", "~> 4.2"
gem "rolify", "~> 6.0"
gem "rails_admin", "~> 3.1"
# Fetching directly from git because this fix it not in gem version 1.0
# https://github.com/decioferreira/omniauth-linkedin-oauth2/issues/70#issuecomment-1484556262
gem "omniauth-linkedin-oauth2", git: "https://github.com/decioferreira/omniauth-linkedin-oauth2.git", branch: "master"
gem "omniauth-rails_csrf_protection"
gem 'airbrake', '~> 13.0', '>= 13.0.3'
gem "paper_trail", "~> 14.0"
gem "meta-tags", '~> 2.18'
gem "sidekiq", "~> 7.1"
gem "blazer", "~> 2.6"
