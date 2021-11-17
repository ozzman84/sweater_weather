class BreweriesService
  class << self
    def find_brewereies(weather, params)
      request = BreweriesClient.request_breweries("/breweries?by_city=#{params[:location].split(',')[-2].strip}")
      breweries = request[1..params[:quantity].to_i].map do |brewery|
        BreweryPoro.new(brewery)
      end

      {
        "data": {
          "id": nil,
          "type": "breweries",
          "attributes": {
            "destination": params[:location],
            "forecast": {
              "summary": weather[:data][:attributes][:current_weather][:conditions],
              "temperature": "#{weather[:data][:attributes][:current_weather][:temperature]} F"
            },
            "breweries": breweries
          }
        }
      }
    end
  end
end
