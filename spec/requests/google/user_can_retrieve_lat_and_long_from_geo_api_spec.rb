require 'rails_helper'

RSpec.describe 'GeoAPI' do
  it 'retrieves lat and long from Geo API' do
    get "/api/v1/geolocation?location=denver,co"

    expect(response).to be_successful

    result = JSON.parse(response.body)['data']['attributes']

    expect(result['lat']).to eq('39.7392358')
    expect(result['long']).to eq('-104.990251')
  end
end