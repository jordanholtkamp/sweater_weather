class Api::V1::SessionsController < ApplicationController
  def create
    if user = User.find_by(email: params[:email])
      session[:user_id] = user.id
      render json: UserSerializer.new(user), status: 200
    else
      render json: {status: 401, error: 'Bad credentials'}
    end
  end
end