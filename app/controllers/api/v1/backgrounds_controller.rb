class BackgroundsController < ApplicationContoller
  def index
    background = BackgroundsFacade.get_background(params[:location])
    render json: ImageSerializer.serialize(background, params[:location])
  end
end
