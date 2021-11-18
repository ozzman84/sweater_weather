class MapQuestService
  class << self
    def add_location(city_state)
      location_data = MapQuestClient.location_info("#{location_uri + city_state}")
      lat_long = filter_data(location_data)
      OpenWeatherService.request_weather(lat_long)
    end

    private

    def filter_data(location_data)
      params = {}
      location_data[:results].each do |item|
        item[:locations].each do |attributes|
          params[:lat] = attributes[:latLng][:lat]
          params[:long] = attributes[:latLng][:lng]
          break
        end
      end
      params
    end

    def location_uri
      '/geocoding/v1/address?location='
    end
  end
end
