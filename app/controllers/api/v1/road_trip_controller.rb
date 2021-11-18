class Api::V1::RoadTripController < ApplicationController
  def create
    trip_data = TripFacade.get_details(trip_params)
    render json: RoadTripSerializer.format_response(trip_data, trip_params)
  end

  private

  def trip_params
    params.permit(:origin, :destination, :api_key)
  end
end
