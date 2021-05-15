require 'rails_helper'

RSpec.describe "GET api/v1/users?email=<user_email>", type: :request do
  describe "Happy Path" do
    before :each do
      seed_test_db
    end

    it "returns a user object with its pets, favorites, and applications" do

      get "/api/v1/users?email=#{@users.first.email}"

      user_object = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(user_object).to be_a(Hash)
      expect(user_object.keys).to eq([:data])
      expect(user_object[:data]).to be_a(Hash)
      expect(user_object[:data].keys).to eq([:id, :type, :attributes])
      expect(user_object[:data][:id]).to eq("#{@users.first.id}")
      expect(user_object[:data][:type]).to eq("full_user")
      expect(user_object[:data][:attributes]).to be_a(Hash)
      expect(user_object[:data][:attributes].keys).to eq([:username, :email, :pets, :favorites, :applications, :pet_applications])
      expect(user_object[:data][:attributes][:username]).to eq(@users.first.username)
      expect(user_object[:data][:attributes][:email]).to eq(@users.first.email)
      expect(user_object[:data][:attributes][:pets]).to be_an(Array)
      expect(user_object[:data][:attributes][:pets].first).to be_a(Hash)
      expect(user_object[:data][:attributes][:pets].first.keys).to eq([ :id, :user_id, :name, :age, :pet_type, :breed, :description, :gender, :fixed, :house_trained, :photo_url_1, :photo_url_2, :photo_url_3, :good_with_kids, :good_with_animals, :created_at, :updated_at])
      expect(user_object[:data][:attributes][:favorites]).to be_an(Array)
      expect(user_object[:data][:attributes][:favorites].first).to be_a(Hash)
      expect(user_object[:data][:attributes][:favorites].first.keys).to eq([ :id, :user_id, :name, :age, :pet_type, :breed, :description, :gender, :fixed, :house_trained, :photo_url_1, :photo_url_2, :photo_url_3, :good_with_kids, :good_with_animals, :created_at, :updated_at])
      expect(user_object[:data][:attributes][:applications]).to be_an(Array)
      expect(user_object[:data][:attributes][:applications].first).to be_a(Hash)
      expect(user_object[:data][:attributes][:applications].first.keys).to eq([:id, :user_id, :pet_id, :status, :description, :created_at, :updated_at])
      expect(user_object[:data][:attributes][:pet_applications]).to be_an(Array)
      expect(user_object[:data][:attributes][:pet_applications].first).to be_a(Hash)
      expect(user_object[:data][:attributes][:pet_applications].first.keys).to eq([:id, :user_id, :pet_id, :status, :description, :created_at, :updated_at])
    end
  end
end