class Api::V1::BreweriesController < ApplicationController
  def index
    weather = WeatherFacade.get_weather(params[:location])
    breweries = BreweriesService.get_breweries(weather, breweries_params)

    binding.pry
  end

  private

  def breweries_params
    params.require(:breweries).permit(:location, :quantity)
  end
end
