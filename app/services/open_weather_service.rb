class OpenWeatherService
  class << self
    def request_weather(lat_long)
      weather_data = OpenWeatherClient.get_weather(uri(lat_long))
    end

    def activity_weather(lat_long, city_state)
      activity_weather = OpenWeatherClient.get_weather(uri(lat_long))
      activities_params = activity_filter(activity_weather, city_state)
      ActivitiesService.request_activites(activities_params)
    end

    private

    def activity_filter(weather_data, city_state)
      {
        'attributes': {
          'destination': city_state,
          'forecast': {
            'summary': activity_weather[:current][:weather][0][:description],
            'temperature': activity_weather[:current][:temp]
          }
        }
      }
    end

    def uri(lat_long)
      "/data/2.5/onecall?lat=#{lat_long[:lat]}&lon=#{lat_long[:long]}"
    end
  end
end
