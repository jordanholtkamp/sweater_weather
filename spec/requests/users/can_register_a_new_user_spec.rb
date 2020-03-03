require 'rails_helper'

RSpec.describe 'user registration' do
  it 'can register a new user' do
    post '/api/v1/users', params:{
      email: 'kyle@monster.com',
      password: 'ilovemonster',
      password_confrimation: 'ilovemonster'
     } #.to_json, headers: {
    #   'Content-Type' => 'application/json',
    #   'Accept' => 'application/json'
    # }

    expect(response).to be_successful

    user_response = JSON.parse(response.body, symbolize_names: true)
    require 'pry'; binding.pry
  end
end

