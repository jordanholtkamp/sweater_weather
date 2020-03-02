class Daily
  def self.info(forecast_data)
    forecast_data[:daily][:data][0..4].map do |day|
      {
        summary: day[:summary],
        icon: day[:icon],
        precip_percent: day[:precipProbability],
        precip_type: day[:precipType],
        high: day[:temperatureHigh],
        low: day[:temperatureLow],
        day: Time.at(day[:time]).in_time_zone('UTC').strftime('%A')
      }
    end
  end
end