require 'httparty'
require 'json'

def fetch_events(api_key, city)
  response = HTTParty.get("https://www.eventbriteapi.com/v3/events/search/?location.address=#{city}&token=#{api_key}")
  JSON.parse(response.body)['events']
end

def display_event_info(events)
  events.each do |event|
    puts "Name: #{event['name']['text']}"
    puts "Venue: #{event['venue']['name']}"
    puts "Date: #{event['start']['local']}"
    puts "----------------------------------------"
  end
end

api_key = 'your_eventbrite_api_key'
city = ARGV[0]
events = fetch_events(api_key, city)
display_event_info(events)
