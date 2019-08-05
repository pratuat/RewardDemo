# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.0'

gem 'require_all'
gem 'sinatra'
gem 'slim'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'guard-rspec', require: false
end

group :development do
  gem 'rubocop', '~> 0.74.0', require: false
end

group :test do
  gem 'faker'
  gem 'rack-test'
  gem 'rspec'
  gem 'nokogiri'
end
