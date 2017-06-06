source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'dotenv-rails'
gem 'enumerize'
gem 'font-awesome-rails'
gem 'gravtastic'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'pg'
gem 'puma', '~> 3.7'
gem 'simple_form'
gem 'rails', '~> 5.1.0'
gem 'sass-rails', '~> 5.0'
gem 'simple_form'
gem 'turbolinks', '~> 5'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13.0'
  gem 'factory_girl_rails'
  gem 'rspec-rails', '~> 3.6.0'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', '~> 3.1.1'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
