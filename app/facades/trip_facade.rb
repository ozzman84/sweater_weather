class TripFacade
  class << self
    def get_details(locations)
      travel_response = MapQuestClient.location_info(trip_points(locations))
      lat_long = lat_lng_parse(travel_response[:route][:boundingBox][:lr])
      destination_weather = OpenWeatherService.request_weather(lat_long)
      [travel_response[:route], destination_weather]
    end

    private

    def lat_lng_parse(info)
      {
        lat: info[:lat],
        long: info[:lng]
      }
    end

    def trip_points(locations)
      "/directions/v2/route?from=#{locations[:origin]}&to=#{locations[:destination]}"
    end
  end
end
