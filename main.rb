# frozen_string_literal: true

require 'discordrb'
require 'json'

def not_number?(string)
  false if Float string
rescue StandardError
  true
end

file = File.read './config.json'
config = JSON.parse file

token = config['token']
prefix = config['prefix']

bot = Discordrb::Commands::CommandBot.new token: token, prefix: prefix

bot.command :even do |event, number|
  if number.nil?
    event.respond 'No number was given.'
    break
  elsif not_number? number
    event.respond 'This is text, not a number.'
    break
  end
  "Number #{number} is #{number.to_i.even? ? 'even' : 'odd'}."
end

bot.run
