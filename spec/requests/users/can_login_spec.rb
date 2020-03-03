require 'rails_helper'

RSpec.describe 'As a registered user' do
  before :each do
    post '/api/v1/users', params:{
      email: 'kyle@monster.com',
      password: 'ilovemonster',
      password_confirmation: 'ilovemonster'
     }  

     @kyle = User.last
  end

  it 'I can login with good credentials' do
    post '/api/v1/sessions', params: {
      email: 'kyle@monster.com',
      password: 'ilovemonster'
    }

    expect(response.status).to eq(200)

    session = JSON.parse(response.body)['data']['attributes']
    expect(session['api_key']).to eq(@kyle.api_key)
  end

  it 'I cannot login with wrong email or password' do
    post '/api/v1/sessions', params: {
      email: 'kyle@red_bull.com',
      password: 'ilovemonster'
    }

    expect(response.status).to eq(401)

    message = JSON.parse(response.body)
    expect(message['error']).to eq('Bad credentials')
  end
end