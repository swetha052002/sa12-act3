require 'httparty'
require 'json'

def fetch_exchange_rate(source_currency, target_currency)
  response = HTTParty.get("https://api.exchangerate-api.com/v4/latest/#{source_currency}")
  JSON.parse(response.body)['rates'][target_currency]
end

def convert_currency(amount, source_currency, target_currency)
  exchange_rate = fetch_exchange_rate(source_currency, target_currency)
  converted_amount = amount * exchange_rate
  converted_amount.round(2)
end

source_currency = ARGV[0]
target_currency = ARGV[1]
amount = ARGV[2].to_f

converted_amount = convert_currency(amount, source_currency, target_currency)
puts "#{amount} #{source_currency} is equal to #{converted_amount} #{target_currency}"
