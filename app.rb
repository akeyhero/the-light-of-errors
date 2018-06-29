#!/usr/bin/env ruby
# encoding: utf-8

require 'bundler'
Bundler.require

configure :development do
  require 'sinatra/reloader'
end

get '/' do
  content_type 'application/json'
  { status: 'OK' }.to_json
end

post '/' do
  content_type 'application/json'

  body = request.body.read

  if body == ''
    status 202
    { status: 'Accepted' }.to_json
  else
    status 400
    { status: 'Bad Request' }.to_json
  end
end
