class WeatherFacade
  class << self
    def get_weather(city_state)
      MapQuestService.add_location(city_state)
    end
  end
end
