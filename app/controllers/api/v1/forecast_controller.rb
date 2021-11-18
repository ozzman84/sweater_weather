class Api::V1::ForecastController < ApplicationController
  def index
    weather = WeatherFacade.get_weather(params[:location])
    render json: WeatherSerializer.form_data(weather)
  end
end
