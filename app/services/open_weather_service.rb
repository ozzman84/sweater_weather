class OpenWeatherService
  class << self
    def request_weather(lat_long)
      weather_data = OpenWeatherClient.get_weather(uri(lat_long))
      filter_data(weather_data)
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

    def filter_data(data)
      {
        'data': {
          'id': nil,
          'type': 'forecast',
            'attributes': {
              'current_weather': current_weather(data[:current]),
              'daily_weather': daily_weather(data[:daily]),
              'hourly_weather': hourly_weather(data[:hourly])
          }
        }
      }
    end

    def current_weather(attribute)
      {
        datetime: Time.zone.at(attribute[:dt]).to_s,
        sunrise: Time.zone.at(attribute[:sunrise]).to_s,
        sunset: Time.zone.at(attribute[:sunset]).to_s,
        temperature: attribute[:temp],
        feels_like: attribute[:feels_like],
        humidity: attribute[:humidity],
        uvi: attribute[:uvi],
        visibility: attribute[:visibility],
        conditions: attribute[:weather][0][:description],
        icon: attribute[:weather][0][:icon]
      }
    end

    def daily_weather(attribute)
      attribute.map do |item|
        daily_item(item)
      end
    end

    def daily_item(attribute)
      {
        date: Time.zone.at(attribute[:dt]).strftime('%Y-%m-%d'),
        sunrise: Time.zone.at(attribute[:sunrise]).to_s,
        sunset: Time.zone.at(attribute[:sunset]).to_s,
        max_temp: attribute[:temp][:max],
        min_temp: attribute[:temp][:min],
        conditions: attribute[:weather][0][:description],
        icon: attribute[:weather][0][:icon]
      }
    end

    def hourly_weather(attribute)
      attribute.map do |item|
        hourly_item(item)
      end
    end

    def hourly_item(attribute)
      {
        time: Time.zone.at(attribute[:dt]).to_s,
        temperature: attribute[:temp],
        conditions: attribute[:weather][0][:description],
        icon: attribute[:weather][0][:icon]
      }
    end
  end
end
