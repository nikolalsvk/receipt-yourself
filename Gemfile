source 'https://rubygems.org'

ruby '2.2.3'

gem 'rails', '4.2.4'

gem 'rails-api'

gem 'pg'

gem 'devise_token_auth'
gem 'omniauth'

group :development, :test do
  gem 'byebug'
  gem 'spring'
end

group :development do
  gem "rails-erd"
end

group :test do
  gem 'cucumber-rails', require: false
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers', '~> 3.1'
end

group :production do
  gem 'rails_12factor'
end
