require "rails_helper"

RSpec.describe "api/v1/pet/:id" do
  before :each do
    seed_test_db
  end

  describe "Happy Path" do
    it "returns a pet object when a valid pet id is provided" do
      pet = @users.first.pets.first
      get "/api/v1/pets/#{pet.id}"

      body = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(body).to be_a(Hash)
      expect(body).to have_key(:data)
      expect(body[:data]).to be_a(Hash)
      expect(body[:data].keys).to eq([:id, :type, :attributes])
      expect(body[:data][:id]).to eq("#{pet.id}")
      expect(body[:data][:type]).to eq('pet')
      expect(body[:data][:attributes].keys).to eq([:user_id, :name, :age, :pet_type, :breed, :description, :gender, :fixed, :house_trained, :good_with_kids, :good_with_animals, :photo_url_1, :photo_url_2, :photo_url_3])
      expect(body[:data][:attributes][:user_id]).to eq(pet.user_id)
      expect(body[:data][:attributes][:name]).to eq(pet.name)
      expect(body[:data][:attributes][:age]).to eq(pet.age)
      expect(body[:data][:attributes][:pet_type]).to eq(pet.pet_type)
      expect(body[:data][:attributes][:breed]).to eq(pet.breed)
      expect(body[:data][:attributes][:description]).to eq(pet.description)
      expect(body[:data][:attributes][:gender]).to eq(pet.gender)
      expect(body[:data][:attributes][:fixed]).to eq(pet.fixed)
      expect(body[:data][:attributes][:house_trained]).to eq(pet.house_trained)
      expect(body[:data][:attributes][:good_with_kids]).to eq(pet.good_with_kids)
      expect(body[:data][:attributes][:good_with_animals]).to eq(pet.good_with_animals)
      expect(body[:data][:attributes][:photo_url_1]).to eq(pet.photo_url_1)
      expect(body[:data][:attributes][:photo_url_2]).to eq(pet.photo_url_2)
      expect(body[:data][:attributes][:photo_url_3]).to eq(pet.photo_url_3)
    end
  end

  describe "Sad Path and Edge Case" do
    it "returns an error if an invalid ID is provided" do
      get "/api/v1/pets/10000000"

      data = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(404)
      expect(data).to eq({error: "Couldn't find Pet with 'id'=10000000"})
    end
  end
end
