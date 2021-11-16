class BreweriesService
  class << self
    def find_brewereies(weather, params)
      request = BreweriesClient.request_+breweries("/breweries?by_city=#{params[:location].split(',')[-2].strip}")
      breweries = request.each do |brewery|
        BreweryPoro.new(brewery)
      end
    end
  end
end
