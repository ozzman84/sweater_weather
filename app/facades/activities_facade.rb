class ActivitiesFacade
  class << self
    def get_activities(city_state)
      event = MapQuestService.activity_location(city_state)
    end
  end
end
