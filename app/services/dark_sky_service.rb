class DarkSkyService
  def initialize(coordinates, arrival_time = nil)
    @coordinates = coordinates
    @arrival_time = arrival_time
  end

  def get_forecast
    
  end

  def future_forecast
    key = ENV['DARK_SKY_KEY']
    forecast_data = conn.get("/forecast/#{key}/#{@coordinates},#{@arrival_time}").body
    JSON.parse(forecast_data, symbolize_names: true)[:currently][:summary]
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