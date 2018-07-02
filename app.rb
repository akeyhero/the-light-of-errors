#!/usr/bin/env ruby
# encoding: utf-8

GPIO_PIN = 8

$:.unshift File.dirname(__FILE__)

require 'bundler'
Bundler.require

configure :development do
  require 'sinatra/reloader'
end

require 'lib/gpio'

gpio = GPIO.new GPIO_PIN

before do
  content_type 'application/json'
end

get '/' do
  { status: 'OK', value: gpio.read }.to_json
end

post '/' do
  body = request.body.read

  if body == ''
    gpio.on

    status 201
    { status: 'Created' }.to_json
  else
    status 400
    { status: 'Bad Request' }.to_json
  end
end

delete '/' do
  gpio.off

  status 204
  { status: 'No Content' }.to_json
end
