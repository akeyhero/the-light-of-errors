#!/usr/bin/env ruby
# encoding: utf-8

$:.unshift File.dirname(__FILE__)

require 'bundler'
Bundler.require

configure :development do
  require 'sinatra/reloader'
end

require 'lib/light'

light = Light.new :default

before do
  content_type 'application/json'
end

get '/' do
  { status: 'OK', value: light.on? ? 'on' : 'off' }.to_json
end

post '/' do
  body = request.body.read

  if body == ''
    light.on!

    status 201
    { status: 'Created' }.to_json
  else
    status 400
    { status: 'Bad Request' }.to_json
  end
end

delete '/' do
  light.off!

  status 204
end
