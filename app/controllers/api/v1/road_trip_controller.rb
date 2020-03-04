class Api::V1::RoadTripController < ApplicationController
  def create
    if User.find_by(api_key: params[:api_key])
      successful_road_trip
    else
      not_a_user
    end
  end

  private

  def not_a_user
    render json: {error: 'Please make sure you are signed in.'}, 
    status: 401
  end

  def successful_road_trip
    road_trip = RoadTrip.new(road_trip_params)
    render json: RoadTripSerializer.new(road_trip)
  end

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end
end