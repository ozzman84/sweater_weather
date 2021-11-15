class ActivitiesFacade
  class << self
    def get_activites(weather, city_state)
      activites = ActivitiesService.request_activities(weather, city_state)
    end
  end
end
