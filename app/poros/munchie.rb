class Munchie
  attr_reader :id

  def initialize(params)
    @start = params[:start]
    @end = params[:end]
    @food = params[:food]
    @id = nil
  end

  def end_location
    @end # change this to make the city state look normal
  end

  
  def forecast
    data = DarkSkyService.new(get_destination_coordinates, arrival_time).future_forecast
  end
  
  def restaurant
    {
      name: restuarant_info[0],
      address: restaurant_info[1]
    }
  end
  
  def travel_time
    both_travel_times[0]
  end

  private
  
  def restuarant_info
    YelpService.new(arrival_time, @food, @end).info
  end
  
  def both_travel_times
    GoogleGeoService.new("#{@start},#{@end}").travel_time
  end

  def arrival_time
    both_travel_times[1] + Time.now.to_i
  end

  def get_destination_coordinates
    GoogleGeoService.new(@end.split(',')[0]).lat_and_long
  end
end