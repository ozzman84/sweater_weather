class OpenWeatherService
  class << self
    def request_weather(lat_long)
      OpenWeatherClient.get_weather(uri(lat_long))
    end

    private

    def uri(lat_long)
      "/data/2.5/onecall?lat=#{lat_long[:lat]}&lon=#{lat_long[:long]}"
    end
  end
end
