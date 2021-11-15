class Api::V1::ForecastController < ApplicationController
  def index
    weather = WeatherFacade.get_weather(params[:location])
    render jsonapi: weather, status: :ok
  end
end
