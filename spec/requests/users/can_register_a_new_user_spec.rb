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
    post '/api/v1/users', params:{
      email: 'kyle@monster.com',
      password: 'ilovemonster',
      password_confirmation: 'ilovemonster'
     }

     kyle = User.last

     post '/api/v1/users', params: {
      email: 'kyle@monster.com',
      password: 'ilovemonster',
      password_confirmation: 'ilovemonster'
     }

     message = JSON.parse(response.body)

     expect(response.status).to eq(400)
     expect(User.count).to eq(1)
     expect(User.first.api_key).to eq(kyle.api_key)

     expect(message['email']).to eq(['has already been taken'])
  end

  it 'will not register if passwords do not match' do
    post '/api/v1/users', params:{
      email: 'kyle@monster.com',
      password: 'ilovemonster',
      password_confirmation: 'kjdfjkndjfnwejdfkj'
     }

     expect(response.status).to eq(400)

     message = JSON.parse(response.body)

     expect(message['password_confirmation'][0]).to eq("doesn't match Password")
  end
end

