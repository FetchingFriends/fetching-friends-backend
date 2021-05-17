require 'rails_helper'

RSpec.describe 'User registration request' do
  describe 'happy path' do
    it "can find a user's pets" do
      user = create(:user)
      (5).times do
        create(:pet, user: user)
      end

      get "/api/v1/users/#{user.id}/pets"
      user_pets = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(user_pets).to be_a(Hash)
      expect(user_pets.count).to eq(1)
      expect(user_pets).to have_key(:data)
      expect(user_pets[:data]).to be_a(Array)
      expect(user_pets[:data].count).to eq(5)
      user_pets[:data].each do |pet|
        expect(pet).to be_a(Hash)
        expect(pet.count).to eq(3)
        expect(pet.keys).to eq([:id, :type, :attributes])
        expect(pet[:id]).to be_a(String)
        expect(pet[:type]).to eq('pet')
        expect(pet[:attributes].count).to eq(14)
        expect(pet[:attributes].keys).to eq([:user_id, :name, :age, :pet_type, :breed, :description, :gender, :fixed, :house_trained, :good_with_kids, :good_with_animals, :photo_url_1, :photo_url_2, :photo_url_3])
        expect(pet[:attributes][:user_id]).to eq(user.id)
        expect(pet[:attributes][:name]).to be_a(String)
        expect(pet[:attributes][:age]).to be_a(Integer)
        expect(pet[:attributes][:pet_type]).to be_a(String)
        expect(pet[:attributes][:breed]).to be_a(String)
        expect(pet[:attributes][:description]).to be_a(String)
        expect(pet[:attributes][:gender]).to be_a(String)
        expect(pet[:attributes][:fixed]).to be_in([true, false])
        expect(pet[:attributes][:house_trained]).to be_in([true, false])
        expect(pet[:attributes][:good_with_kids]).to be_in([true, false])
        expect(pet[:attributes][:good_with_animals]).to be_in([true, false])
        expect(pet[:attributes][:photo_url_1]).to be_a(String)
        expect(pet[:attributes][:photo_url_2]).to eq(nil)
        expect(pet[:attributes][:photo_url_3]).to eq(nil)
      end
    end
  end

  describe 'sad path' do
    it "will return an empty object if no pets are available" do
      user = create(:user)
      get "/api/v1/users/#{user.id}/pets"
      user_pets = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)

      expect(user_pets).to be_a(Hash)
      expect(user_pets.count).to eq(1)
      expect(user_pets).to have_key(:data)
      expect(user_pets[:data]).to be_a(Array)
      expect(user_pets[:data].count).to eq(0)
    end

    it "will return an error if user does not exist" do
      get '/api/v1/users/10/pets'
      user_pets = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(404)
      expect(user_pets).to be_a(Hash)
      expect(user_pets.count).to eq(2)
      expect(user_pets).to have_key(:error)
      expect(user_pets[:error]).to eq("No such user")
      expect(user_pets).to have_key(:status)
      expect(user_pets[:status]).to eq(404)
    end
  end
end
