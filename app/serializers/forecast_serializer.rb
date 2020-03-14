class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :time_zone, :location, :currently,
             :today, :hourly, :daily
end