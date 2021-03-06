class Api::V1::BreweriesController < ApplicationController
  def index
    weather = WeatherFacade.get_weather(params[:location])
    breweries = BreweriesFacade.get_breweries(weather, breweries_params)
    render json: breweries.to_json
  end

  private

  def breweries_params
    params.permit(:location, :quantity)
  end

  # def gen_params(weather)
  #   {
  #
  #   }
  # end
end
