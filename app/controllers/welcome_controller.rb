class WelcomeController < ApplicationController
  def index
    render json: ‘Welcome to Sweather Weather.’
  end
end