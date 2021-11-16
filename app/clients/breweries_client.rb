class BreweriesClient
  class << self
    def request_breweries(uri)
      response = conn.get(uri)
      parse_data(response)
      binding.pry
    end

    private

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new('https://api.openbrewerydb.org')
    end
  end
end
