class Api::V1::BackgroundsController < ApplicationController
  def index
    background = BackgroundsFacade.get_background(params[:location])
    render json: ImageSerializer.custom_serialize(background, params[:location])
  end
end
