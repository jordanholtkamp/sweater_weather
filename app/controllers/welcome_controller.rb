class WelcomeController < ApplicationController
  def index
    render json: 'Welcome to Sweater Weather.'
  end
end