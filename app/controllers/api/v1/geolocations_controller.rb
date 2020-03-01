class Api::V1::GeolocationsController < ApplicationController
  def show
    city = params[:location]
    
    key = ENV['GOOGLE_API_KEY']
    
    conn = Faraday.new("https://maps.googleapis.com")
    response = conn.get("/maps/api/geocode/json?address=#{city}&key=#{key}")
    
    data = JSON.parse(response.body)['results'][0]['geometry']['location']
    
    new_location = Location.create(city: city, lat: data['lat'], long: data['lng'])

    render json: GeolocationSerializer.new(new_location)
  end
end