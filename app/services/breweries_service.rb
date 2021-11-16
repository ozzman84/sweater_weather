class BreweriesService
  class << self
    def find_brewereies(weather, params)
      request = BreweriesClient.request_breweries("/api/v1/breweries?by_city=#{params[:location].split(',')[-2].strip}")
    end
  end
end
