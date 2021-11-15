class ActivitiesService
  class << self
    def find_activity(city_state)
      activities = ActivitiesClient.request_activities(uri + city_state)
    end

    private

    def uri
      
    end
  end
end
