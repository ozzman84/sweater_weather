class OpenWeatherClient
  class << self
    def get_weather(uri)
      response = conn.get(uri)
      parse_data(response)
    end

    private

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new("https://api.openweathermap.org", params: {
        appid: ENV['open_weather_key'],
        exclude: 'minutely,alerts',
        units: 'imperial'
        }
      )
    end
  end
end
