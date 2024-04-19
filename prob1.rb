require 'httparty'
require 'json'

def fetch_weather_data(city, api_key)
  response = HTTParty.get("https://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{api_key}")
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
api_key = 'YOUR_API_KEY' # Replace 'YOUR_API_KEY' with your actual OpenWeatherMap API key
weather_data = fetch_weather_data(city, api_key)
average_temperature = calculate_average_temperature(weather_data)
display_weather_information(weather_data, city)
puts "Average temperature over the period: #{average_temperature}K"
