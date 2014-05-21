source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.4'

# Use debugger
gem 'debugger', group: [:development, :test]

group :production do
  # For Heroku
  gem 'rails_12factor'
  # Use Uglifier as compressor for JavaScript assets
  gem 'uglifier', '>= 1.3.0'
  # Use Capistrano for deployment
  # gem 'capistrano', group: :development
  gem 'pg'
end

group :development do
  #gem 'activerecord-postgres-hstore'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'sqlite3'
end

group :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'cucumber-rails', :require => false
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'forgery'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

gem 'sass-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'therubyracer'
gem 'less-rails-bootstrap'
gem 'coffee-rails', '~> 4.0.0'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# Шаблонизатор Slim
gem 'slim-rails'

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
#gem 'unicorn'

# Foreign keys
gem 'foreigner'

# Authentication solution
gem 'devise'

# Привилегии
gem 'cancancan', '~> 1.7'

# Automatically restful documentation
# https://github.com/Apipie/apipie-demo
gem 'apipie-rails'

# SimpleForm
gem 'simple_form'

