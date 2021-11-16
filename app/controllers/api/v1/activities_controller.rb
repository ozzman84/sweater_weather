class Api::V1::ActivitiesController < ApplicationController
  def index
    city_state = params[:destination]
    weather = WeatherFacade.get_weather(params[:destination])
    activities = ActivitiesFacade.get_activites(weather, city_state)
    binding.pry
  end
end
