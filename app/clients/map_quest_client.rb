class MapQuestClient
  class << self
    def location_info(uri)
      response = conn.get(uri + api_key)
      parse_data(response)
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
