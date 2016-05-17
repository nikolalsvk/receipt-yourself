source 'https://rubygems.org'

ruby '2.2.3'

gem 'rails', '4.2.4'
gem 'rails-api'

gem 'pg'
gem 'devise_token_auth'
gem 'omniauth'
# Use rack-rewrite to allow use of HTML5 pushState.
gem 'rack-rewrite'

gem 'devise_token_auth'

group :development, :test do
  gem 'spring'
  gem 'byebug'
  gem 'spring'
end

group :test do
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails'
  gem 'selenium-webdriver'
  gem 'capybara'
  gem 'compass'
end

group :production do
  gem 'rails_12factor'
end
