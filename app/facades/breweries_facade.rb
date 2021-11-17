class BreweriesFacade
  class << self
    def get_breweries(weather, params)
      breweries = BreweriesService.find_brewereies(weather, params)
    end
  end
end
