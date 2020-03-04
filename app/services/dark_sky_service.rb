class DarkSkyService
  def initialize(coordinates, arrival_time = nil)
    @coordinates = coordinates
    @arrival_time = arrival_time
  end

  def parsed_forecast
    JSON.parse(weather_response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new('https://api.darksky.net')
  end

  def weather_response
    key = ENV['DARK_SKY_KEY']
    if !@arrival_time
      conn.get("/forecast/#{key}/#{@coordinates}")
    else
      conn.get("/forecast/#{key}/#{@coordinates},#{@arrival_time}")
    end
  end
end