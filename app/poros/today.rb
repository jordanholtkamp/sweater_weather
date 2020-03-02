class Today
  def self.info(data)
    {
      date: Time.now.to_date,
      day_summary: data[:daily][:summary],
      low: data[:daily][:data][0][:temperatureMin],
      high: data[:daily][:data][0][:temperatureMax],
      # night_summary: data[:daily][:data][0][:summary] #needs to change
      night_summary: self.tonight_summary(data[:daily][:data]) 
    }
  end

  def self.tonight_summary(hourly_data)
    require 'pry'; binding.pry
  end
end