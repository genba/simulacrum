# encoding: UTF-8
ENV['RAILS_ENV'] ||= 'test'
require 'use_simplecov'
require 'use_codeclimate'
require 'bundler/setup'
require 'rspec/autorun'
require 'simulacrum'

RSpec.configure do |config|
  config.order = 'random'
end
