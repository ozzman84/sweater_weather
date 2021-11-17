class WeatherFacade
  class << self
    def get_weather(city_state)
      weather = MapQuestService.add_location(city_state)
    end
  end
end
