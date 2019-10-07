source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'rails', '~> 6.0.0'
gem 'pg'
gem 'puma', '~> 3.11'
gem 'jbuilder', '~> 2.7'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'active_model_serializers'
gem 'versionist'

group :development, :test do
  gem 'awesome_print'
  gem 'better_errors', '~> 2.1', '>= 2.1.1'
  gem 'factory_bot_rails'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'shoulda-matchers', '~> 4.0', '>= 4.0.1'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'json-schema'
end
