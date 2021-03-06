class GoogleDirectionService
  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def travel_time
    JSON.parse(response.body, symbolize_names: true)[:routes][0][:legs][0][:duration]
  end

  private

  def conn
    Faraday.new("https://maps.googleapis.com")
  end

  def response
    conn.get("/maps/api/directions/json?origin=#{@origin}&destination=#{@destination}&key=#{ENV['GOOGLE_API_KEY']}")
  end
end