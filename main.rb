require 'discordrb'
require 'yaml'

def not_number?(string)
  false if Float string
rescue StandardError
  true
end

Config = YAML.load_file './config.yml'

token = Config['token']
prefix = Config['prefix']

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