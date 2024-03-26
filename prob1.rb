require 'httparty'
require 'json'

def fetch_weather_data(city)
  response = HTTParty.get("https://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=1c47f0020eeedd6ae8d021698293fb27
  ")
  JSON.parse(response.body)
end

def calculate_average_temperature(weather_data)
  # Dummy calculation for average temperature
  temperatures = weather_data['hourly'].map { |hour| hour['temp'] }
  average_temperature = temperatures.sum / temperatures.size
  average_temperature
end

def display_weather_information(weather_data, city)
  temperature = weather_data['main']['temp']
  humidity = weather_data['main']['humidity']
  weather_conditions = weather_data['weather'].first['description']

  puts "Weather in #{city}:"
  puts "Temperature: #{temperature}K"
  puts "Humidity: #{humidity}%"
  puts "Conditions: #{weather_conditions}"
end

city = ARGV[0]
weather_data = fetch_weather_data(city)
average_temperature = calculate_average_temperature(weather_data)
display_weather_information(weather_data, city)
puts "Average temperature over the period: #{average_temperature}K"
