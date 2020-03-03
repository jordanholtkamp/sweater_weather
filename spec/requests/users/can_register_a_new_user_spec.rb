require 'rails_helper'

RSpec.describe 'user registration' do
  it 'can register a new user' do
    post '/api/v1/users', params:{
      email: 'kyle@monster.com',
      password: 'ilovemonster',
      password_confrimation: 'ilovemonster'
     }

    expect(response).to be_successful
    kyle = User.last

    expect(response.status).to eq(201)

    user_response = JSON.parse(response.body, symbolize_names: true)

    expect(user_response[:data][:attributes][:api_key]).to eq(kyle.api_key)
  end

  it 'will not register with an email already in use' do
    
  end
end

