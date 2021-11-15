class Api::V1::ActivitiesController < ApplicationController
  def index
    activities = ActivitiesFacade.get_activities(params[:destination])
  end
end
