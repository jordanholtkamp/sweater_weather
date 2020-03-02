class Today
  def self.info(data)
    {
      date: Time.now.to_date,
      day_summary: data[:daily][:summary],
      low: data[:daily][:data][0][:temperatureMin],
      high: data[:daily][:data][0][:temperatureMax],
      night_summary: self.tonight_summary(data[:hourly][:data]) 
    }
  end

  def self.tonight_summary(hourly_data)
    night_hour = hourly_data.find do |hour|
      Time.at(hour[:time]).in_time_zone('UTC').hour == 20
    end
    night_hour[:summary]
  end
end
