class BackgroundsClient
  class << self
    def request_background(uri)
      response = conn.get(uri)
      parse_data(response)
    end

    private

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new('https://api.unsplash.com')
    end
  end
end
