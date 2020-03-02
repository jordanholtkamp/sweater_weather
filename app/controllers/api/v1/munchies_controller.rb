class Api::V1::MunchiesController < ApplicationController
  def index
    munchie = Munchie.new(start: params[:start], end: params[:end], food: params[:food])
    render json: MunchieSerializer.new(munchie)
  end
end