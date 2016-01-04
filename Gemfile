source 'https://rubygems.org'

ruby "2.0.0"

# Default authentication
gem 'devise'
# Default engine for views (switching from built-in ERB)
gem "haml"
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Sass-powered Bootstrap 3
gem 'bootstrap-sass', '~> 3.3.6'
# Provides Sprockets implementation for Rails Asset Pipeline
gem 'sprockets-rails', :require => 'sprockets/railtie'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Pearson Learning Studio Gems for various API calls
gem 'learning_studio_authentication', '0.0.1', :path => "lib/learning_studio_authentication"
gem 'learning_studio_content',        '0.0.1', :path => "lib/learning_studio_content"
gem 'learning_studio_core',           '0.0.1', :path => "lib/learning_studio_core"
gem 'learning_studio_exams',          '0.0.1', :path => "lib/learning_studio_exams"
gem 'learning_studio_grades',         '0.0.1', :path => "lib/learning_studio_grades"
# required gems for Pearson Learning Studio
gem 'httpclient', '~> 2.7', '>= 2.7.0.1'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Integrating Chart.js into Rails Asset Pipeline
gem 'chart-js-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

gem 'rails_12factor', group: :production
