source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3',  '>= 6.0.3.3'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Authorisation / authentication
gem 'devise'
gem 'doorkeeper'

# Pagination
gem 'kaminari'
gem 'api-pagination'

gem 'paper_trail'

gem 'mailjet'

group :development, :test do
  gem 'brakeman'
  gem 'bundler-audit'
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'flay'
  gem 'pry'
  gem 'pry-byebug'
  # TODO See https://github.com/pry/pry-coolline/issues/36
  # gem 'pry-coolline', github: 'owst/pry-coolline', branch: 'support_new_pry_config_api'
  # gem 'pry-coolline'
  gem 'pry-stack_explorer'
  gem 'rspec-rails'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubycritic', require: false
  gem 'timecop'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'rails-controller-testing'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
