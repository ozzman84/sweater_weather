class ActivitiesService
  class << self
    def request_activities(activities_params, city_state)
      temp = activities_params[:data][:attributes][:current_weather][:temperature]
      activity_type = event_type(temp)
      summary = activities_params[:data][:attributes][:current_weather][:conditions]
      activities = ActivitiesClient.request_activities(uri, activity_type)
      event_params(activities, city_state, summary, temp)
    end

    def event_type(temp)
      if temp >= 60.00
        params = 'type=recreational'
      elsif temp >= 50.00 && temp < 60.00
        params = 'type=busywork'
      elsif temp < 50.00
        params = 'type=cooking'
      end
    end

    private

    def event_params(activites, city_state, summary, temp)
      {
        'data': {
          'id': nil,
          'type': 'activities',
          'attributes': {
            'destination': city_state,
            'forecast': {
              'summary': summary,
              'temperature': temp
            },
            'activities': activites,
          }
        }
      }
    end

    def uri
      "/api/activity?"
    end
  end
end
