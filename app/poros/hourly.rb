class Hourly
  def self.info(data)
    data[:hourly][:data][0..7].map do |hour|
      {
        time: hour[:time],
        temp: hour[:temperature],
        icon: hour[:icon]
      }
    end
  end
end