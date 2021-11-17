class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user.authenticate(params[:password])
      render json: UsersSerializer.new(user)
    else
      invalid_input
    end
  end

  private

  def invalid_input
    render json: { error: { details: 'Incorrect input' } }, status: 400
  end
end
