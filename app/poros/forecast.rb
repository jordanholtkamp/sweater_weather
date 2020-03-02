class Forecast
  attr_reader :id
  def initialize(location)
    @id = nil
    @location = location
  end

  def google_return
    GoogleGeoService.new(@location)
  end

  def coordinates
    google_return.lat_and_long
  end

  def raw_forecast_data
    DarkSkyService.new(coordinates).parsed_forecast
  end

  def forecast_data
    {
      time_zone: 'UTC',
      location: google_return.address,
      currently: current_data,
      today: today_data,
      hourly: hourly_data,
      daily: daily_data
    }
  end

  def current_data
    Current.info(raw_forecast_data[:currently])
  end

  def today_data
    Today.info(raw_forecast_data)
  end

  def hourly_data
    Hourly.info(raw_forecast_data)
  end

  def daily_data
    Daily.info(raw_forecast_data)
  end
end