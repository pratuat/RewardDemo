source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.0'

gem 'sinatra'
gem 'require_all'
gem 'slim'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'guard-rspec', require: false
end

group :test do
  gem "rspec"
  gem "rack-test"
  gem "faker"
end