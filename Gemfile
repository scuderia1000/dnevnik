source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.4'

gem 'rails', '~> 5.2.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'webpacker'
gem 'jbuilder', '~> 2.5'
gem 'rails-settings-cached'
gem 'wisper', '2.0.0'
gem 'sorcery'
gem 'reform', '>= 2.2.0'
gem 'reform-rails'
gem 'active_model_serializers'
gem 'oj'
gem 'dry-validation', '~> 0.11.1'
gem 'dry-transaction'
gem 'ransack', github: 'activerecord-hackery/ransack'


# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails', '~> 4.0'
  gem 'rspec-rails', '~> 3.7'
  gem 'wisper-rspec', require: false
  gem 'capybara'
  gem 'airborne', '~> 0.2.13'
end

group :test do
  gem 'database_cleaner'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

