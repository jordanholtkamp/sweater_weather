class Api::V1::ForecastController < ApplicationController
  def show
    render json: ForecastSerializer.new(Forecast.new(params[:location]))
  end
end