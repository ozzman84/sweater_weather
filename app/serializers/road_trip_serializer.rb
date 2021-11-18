class RoadTripSerializer
  class << self
    def format_response(trip_info, location_params)
      {
        "data": {
          "id": nil,
          "type": "roadtrip",
          "attributes": {
            "start_city": location_params[:origin],
            "end_city": location_params[:destination],
            "travel_time": trip_info[0][:formattedTime],
            "weather_at_eta": destination_weather(trip_info)
          }
        }
      }
    end

    #Rounded up to the next hour automatically so did not subtract one from hr
    def destination_weather(trip_info)
      hr = trip_info[0][:formattedTime][0..1].to_i
      parse_weather(trip_info[1][:hourly][hr])
    end

    def parse_weather(weather)
      {
        'temperature': weather[:temp],
        'conditions': weather[:weather][0][:description]
      }
    end
  end
end
