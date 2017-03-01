source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end



gem 'rails', '~> 5.0.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'

gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem "haml-rails", "~> 0.9"
gem 'unicorn'
gem 'capybara'
gem 'pry'
gem 'omniauth', '~> 1.6', '>= 1.6.1'
gem 'omniauth-twitter', '~> 1.4'
gem 'omniauth-facebook', '~> 3.0'


group :development, :test do
  gem 'rspec-rails'
  gem 'rails-controller-testing'
  gem 'byebug', platform: :mri
end

group :development do
 
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
 
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
