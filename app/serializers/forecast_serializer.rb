class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :forecast_data
end