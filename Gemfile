source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 6.1.7'

# Database
gem 'pg', '~> 1.1'

# Frontend
gem 'sass-rails', '>= 6'
gem 'simple_form'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.0'

# Backend
gem 'activeadmin'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'dotenv-rails'
gem 'jbuilder', '~> 2.7'
gem 'puma', '~> 5.0'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Generate fake data
gem 'ffaker'

group :development, :test do
  # Debugging
  gem 'pry'
  gem 'pry-rails'

  # Testing
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'shoulda-matchers', '~> 5.0'
end

group :development do
  gem 'spring'

  # Debugging
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'web-console', '>= 4.1.0'

  # Code style
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end
