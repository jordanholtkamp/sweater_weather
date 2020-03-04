require 'rails_helper'

RSpec.describe 'roadtrip endpoint' do
  before :each do
    post '/api/v1/users', params:{
      email: 'kyle@monster.com',
      password: 'ilovemonster',
      password_confirmation: 'ilovemonster'
     }  

     @kyle = User.last
  end

  it 'returns all trip data' do
    post '/api/v1/road_trip', params: {
      origin: 'Denver, CO',
      destination: 'Pueblo, CO',
      api_key: @kyle.api_key
    }

    expect(response).to be_successful

    trip = JSON.parse(response.body)['data']

    expect(trip['attributes']['origin']).to eq('Denver, CO')
    expect(trip['attributes']['destination']).to eq('Pueblo, CO')
    expect(trip['attributes']['travel_time']).to eq('1 hour 48 mins')
  end
end