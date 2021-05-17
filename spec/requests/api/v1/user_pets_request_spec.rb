require 'rails_helper'

RSpec.describe 'User registration request' do
  describe 'happy path' do
    it "can find a user's pets" do
      get '/api/v1/users/10/pets'
    end
  end

  describe 'sad path' do
    it "will return an empty object if no pets are available" do
      user = create(:user)
      get "/api/v1/users/#{user.id}/pets"
    end

    it "will return an error if user does not exist" do
      get '/api/v1/users/10/pets'
    end
  end
end
