class BackgroundsController < ApplicationContoller
  def index
    background = BackgroundsFacade.get_background(params[:location])
  end
end
