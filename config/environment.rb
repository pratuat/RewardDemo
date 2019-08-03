require "rubygems"
require "bundler"

ENV['RACK_ENV'] ||= 'development'
Bundler.require(:default, ENV['RACK_ENV'])

require_all 'app'