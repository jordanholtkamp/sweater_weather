class GoogleGeoService
  def initialize(location)
    @location = location
  end

  
  def lat_and_long
    lat = parsed['results'][0]['geometry']['location']['lat']
    long = parsed['results'][0]['geometry']['location']['lng']
    "#{lat},#{long}"
  end

  def travel_time
    JSON.parse(directions_response.body, symbolize_names: true)[:routes][0][:legs][0][:duration][:text]
  end

  def address
    parsed['results'][0]['formatted_address']
  end

  private
  
  def conn
    Faraday.new("https://maps.googleapis.com")
  end
  
  def response
    key = ENV['GOOGLE_API_KEY']
    conn.get("/maps/api/geocode/json?address=#{@location}&key=#{key}")
  end

  def parsed
    JSON.parse(response.body)
  end

  def directions_response
    origin = @location.split(',')[0]
    destination = @location.split(',')[2]
    conn.get("/maps/api/directions/json?origin=#{origin}&destination=#{destination}&key=#{ENV['GOOGLE_API_KEY']}")
  end
end