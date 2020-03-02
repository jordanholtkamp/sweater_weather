class YelpService

  def initialize(time, food, destination)
    @time = time
    @food = food
    @destination = destination
  end

  def info
    response
  end

  private

  def conn
    Faraday.new('https://api.yelp.com/v3') do |f|
      f.adapter = Faraday.default_adapter
      f.headers['Authorization'] = "Bearer #{ENV['YELP_KEY']}"
    end
  end

  def response
  require 'pry'; binding.pry
    conn.get("/businesses/search?term=#{@food}&location=#{@destination.split(',')[0]}&open_at=#{@time}")
  end
end