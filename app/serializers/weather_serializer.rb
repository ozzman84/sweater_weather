class WeatherSerializer
  class << self
    def form_data(data)
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
      attribute[0..4].map do |item|
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
      attribute[0..7].map do |item|
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
