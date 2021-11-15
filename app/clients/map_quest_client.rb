class MapQuestClient
  class << self
    def request_lat_long(uri)
      response = conn.get(uri + api_key)
      parse_data(response)
    end

    def activity_lat_long(activity_params)
      response = conn.get(activities_params.merge(api_key))
      parse_data(response, activity_params)
    end

    private

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new('http://www.mapquestapi.com')
    end

    def api_key
      "&key=#{ENV['map_quest_key']}"
    end
  end
end
