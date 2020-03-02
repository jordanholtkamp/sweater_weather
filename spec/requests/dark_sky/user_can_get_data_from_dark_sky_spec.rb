require 'rails_helper'

RSpec.describe 'Dark Sky API' do
  it 'can take a lat and long and get needed forecast data' do
    location = 'denver,co'
    get "/api/v1/forecast?location=#{location}"

    expect(response).to be_successful

    forecast = JSON.parse(response.body, symbolize_names: true)[:data][:attributes][:forecast_data]

    expect(forecast[:currently].keys).to eq([:time, :summary, :icon, :temp, :feels_like, :humidity, :visibility, :uv_index])

    expect(forecast[:location]). to eq('Denver, CO, USA')

    expect(forecast[:hourly].count).to eq(8)
    expect(forecast[:hourly][0].keys).to eq([:time, :temp, :icon])

    expect(forecast[:daily].count).to eq(5)
    expect(forecast[:daily][0].keys).to eq([:summary, :icon, :precip_percent, :precip_type, :high, :low, :day])
  end
end