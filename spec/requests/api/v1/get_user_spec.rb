require 'rails_helper'

RSpec.describe "GET api/v1/users?email=<user_email>" do
  describe "Happy Path" do
    it "returns a user object with its pets, favorites, and applications" do
      @user = User.create!(username: "cool_cat", email: "email@domain.com")
      @pet = @user.pets.create!(name: "dog", pet_type: 1, description: "a good boy", gender: "M", photo_url_1: "a photo", age: 2)

      get "/api/v1/users?email=#{@user.email}"

      user_object = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(user_object).to be_a(Hash)
      expect(user_object.keys).to eq([:data])
      expect(user_object[:data]).to be_a(Hash)
      expect(user_object[:data].keys).to eq([:id, :type, :attributes])
      expect(user_object[:data][:id]).to eq("#{@user.id}")
      expect(user_object[:data][:type]).to eq("full_user")
      expect(user_object[:data][:attributes]).to be_a(Hash)
      expect(user_object[:data][:attributes].keys).to eq([:username, :email, :pets, :favorites, :applications, :pet_applications])
      expect(user_object[:data][:attributes][:username]).to eq(@user.username)
      expect(user_object[:data][:attributes][:email]).to eq(@user.email)
      expect(user_object[:data][:attributes][:pets]).to be_an(Array)
      expect(user_object[:data][:attributes][:pets].first).to be_a(Hash)
      expect(user_object[:data][:attributes][:favorites]).to be_an(Array)
      # expect(user_object[:data][:attributes][:favorites].first).to be_a(Hash)
      expect(user_object[:data][:attributes][:applications]).to be_an(Array)
      # expect(user_object[:data][:attributes][:applications].first).to be_a(Hash)
      expect(user_object[:data][:attributes][:pet_applications]).to be_an(Array)
      # expect(user_object[:data][:attributes][:pet_applications].first).to be_a(Hash)
    end
  end
end
