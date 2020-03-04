class RoadTrip
  attr_reader :id, :origin, :destination

  def initialize(params)
    @origin = params[:origin]
    @destination = params[:destination]
    @api_key = params[:api_key]
    @id = nil
  end

  def travel_time
    get_travel_data[:text]
  end

  def arrival_forecast
    [arrival_temp, arrival_summary]
  end

  private

  def get_destination_coordinates
    GoogleGeoService.new(@destination).lat_and_long
  end

  def arrival_temp
    x = get_future_weather[:currently][:temperature]
  end

  def arrival_summary
    get_future_weather[:currently][:summary]
  end

  def get_future_weather
    @service ||= DarkSkyService.new(get_destination_coordinates, arrival_time).parsed_forecast
  end

  def arrival_time
    get_travel_data[:value] + Time.now.to_i
  end
  
  def get_travel_data
    @direction_service ||= GoogleDirectionService.new(@origin, @destination).travel_time
  end
end