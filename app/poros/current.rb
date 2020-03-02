class Current
  def self.info(current_data)
    {
      time: current_data[:time],
      summary: current_data[:summary],
      icon: current_data[:icon],
      temp: current_data[:temperature],
      feels_like: current_data[:apparentTemperature],
      humidity: current_data[:humidity],
      visibility: current_data[:visibility],
      uv_index: current_data[:uvIndex]
    }
  end
end