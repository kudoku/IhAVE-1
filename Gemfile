source 'https://rubygems.org'

ruby '2.1.5'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.8'
gem 'bootstrap-sass'
gem 'bcrypt',               '3.1.7'
# Use postgresql as the database for Active Record
gem 'pg'
gem 'devise'


gem 'acts-as-taggable-on', '~> 3.4'
gem "paperclip", "~> 4.2" 
gem 'aws-sdk'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
gem 'faker'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'


gem 'bootstrap_form'
gem 'font-awesome-sass'
# # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc
# pagination
gem 'kaminari'
# infinite scroll
gem 'jquery-infinite-pages'

gem 'puma'


# g+omniauth
gem 'omniauth-google-oauth2'
# pg search
gem 'pg_search'
# delayed job for email notifications
gem 'delayed_job_active_record'

gem "letter_opener", :group => :development

group :development, :test do
  gem 'spork-rails'
  gem 'spring-commands-rspec'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'dotenv-rails'
  gem 'pry-byebug'
  gem 'better_errors'
  gem 'binding_of_caller'
  # gem 'bootstrap-will_paginate'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end




gem 'simplecov', :require => false, :group => :test



group :production do
  gem 'rails_12factor', '0.0.2'
end