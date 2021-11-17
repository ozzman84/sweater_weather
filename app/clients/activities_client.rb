class ActivitiesClient
  class << self
    def request_activities(uri, type)
      response1 = conn.get(uri + type)
      response2 = conn.get(uri + 'type=relaxation')
      r1 = parse_data(response1)
      r2 = parse_data(response2)
      [r1, r2]
    end

    private

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new('http://www.boredapi.com')
    end
  end
end
