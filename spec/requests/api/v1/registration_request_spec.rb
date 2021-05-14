require 'rails_helper'

RSpec.describe 'User registration request' do
  describe 'happy path' do
    it 'can create a user' do
      user_params = { username: 'bobgu',
                      email: 'example@email.com'}
      headers = {"CONTENT_TYPE" => "application/json",
                 "ACCEPT"       => "application/json"}

      post '/api/v1/users', headers: headers, params: user_params.to_json

      new_user = User.last
      new_user_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(response.content_type).to eq("application/json")
    end
  end
end
