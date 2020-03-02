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

  def travel_time
    GoogleGeoService.new("#{@start},#{@end}").travel_time
  end

  def forecast
    hi = DarkSkyService.new(get_destination_coordinates).parsed_forecast
    require 'pry'; binding.pry
  end

  def get_destination_coordinates
    GoogleGeoService.new(@end.split(',')[0]).lat_and_long
  end
end