require 'rails_helper'

RSpec.describe "GET api/v1/users?email=<user_email>" do
  describe "Happy Path" do
    it "returns a user object with its pets, favorites, and applications" do
      @user = User.create!(username: "cool_cat", email: "email@domain.com")

      get "/api/v1/users?email=#{@user.email}"

      user_object = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(user_object).to be_a(Hash)
      expect(user_object.keys).to eq([:data])
      expect(user_object[:data]).to be_a(Hash)
      expect(user_object[:data].keys).to eq([:id, :type, :attributes])
      expect(user_object[:data][:id]).to eq("#{@user.id}")
      expect(user_object[:data][:type]).to eq("user")
      expect(user_object[:data][:attributes]).to be_a(Hash)
      expect(user_object[:data][:attributes].keys).to eq([:username, :email, :pets, :favorites, :applications, :pet_applications])
    end
  end
end
