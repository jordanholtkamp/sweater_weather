class DarkSkyService
  def initialize(coordinates)
    @coordinates = coordinates
  end

  def get_forecast
    
  end

  def conn
    Faraday.new('https://api.darksky.net/')
  end

  def response
    key = ENV['DARK_SKY_KEY']
    conn.get("/forecast/#{key}/#{@coordinates}")
  end

  def parsed_forecast
    JSON.parse(response.body, symbolize_names: true)
  end
end