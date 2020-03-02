class GoogleGeoService
  def initialize(location)
    @location = location
  end

  
  def lat_and_long
    lat = parsed['results'][0]['geometry']['location']['lat']
    long = parsed['results'][0]['geometry']['location']['lng']
    "#{lat},#{long}"
  end

  def address
    parsed['results'][0]['formatted_address']
  end
  
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
end