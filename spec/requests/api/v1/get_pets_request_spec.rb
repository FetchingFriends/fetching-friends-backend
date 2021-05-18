require 'rails_helper'

RSpec.describe 'User pets request' do
  describe 'happy path' do
    before :each do
      @user = create(:user)
      @user2 = create(:user)
      (2).times do
        create(:pet, user: @user)
      end
      (3).times do
        create(:pet, user: @user2)
      end
      (6).times do
        create(:pet, user: @user, pet_type: 0)
      end
      (3).times do
        create(:pet, user: @user, pet_type: 2)
      end
    end

    it "can return all instances of a specified pet type" do

      get "/api/v1/pets?type=dogs"
      pets = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(pets).to be_a(Hash)
      expect(pets.count).to eq(1)
      expect(pets).to have_key(:data)
      expect(pets[:data]).to be_a(Array)
      expect(pets[:data].count).to eq(5)
      pets[:data].each do |pet|
        expect(pet).to be_a(Hash)
        expect(pet.count).to eq(3)
        expect(pet.keys).to eq([:id, :type, :attributes])
        expect(pet[:id]).to be_a(String)
        expect(pet[:type]).to eq('pet')
        expect(pet[:attributes].count).to eq(14)
        expect(pet[:attributes].keys).to eq([:user_id, :name, :age, :pet_type, :breed, :description, :gender, :fixed, :house_trained, :good_with_kids, :good_with_animals, :photo_url_1, :photo_url_2, :photo_url_3])
        expect(pet[:attributes][:user_id]).to be_a(Integer)
        expect(pet[:attributes][:name]).to be_a(String)
        expect(pet[:attributes][:age]).to be_a(Integer)
        expect(pet[:attributes][:pet_type]).to eq('dog')
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

    it "will return the same response if pet type is plural or singular " do
      get "/api/v1/pets?type=dogs"
      pets_1 = JSON.parse(response.body, symbolize_names: true)
      get "/api/v1/pets?type=dog"
      pets_2 = JSON.parse(response.body, symbolize_names: true)

      expect(pets_1).to eq(pets_2)
    end
  end

  describe 'sad path' do
    it "will return an empty object if no pets are available" do
      get "/api/v1/pets?type=dogs"
      expect(response).to be_successful
      expect(response.status).to eq(200)

      pets = JSON.parse(response.body, symbolize_names: true)
      expect(pets).to be_a(Hash)
      expect(pets.count).to eq(1)
      expect(pets).to have_key(:data)
      expect(pets[:data]).to be_a(Array)
      expect(pets[:data].count).to eq(0)
    end

    it "will return an error if searched for a type does not exist" do
      get "/api/v1/pets?type=pigs"
      pets = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(400)
      expect(pets).to be_a(Hash)
      expect(pets.count).to eq(1)
      expect(pets).to have_key(:error)
      expect(pets[:error]).to eq("Pet type not recognized")
    end

    it "will return an error if searched for a type does not exist" do
      get "/api/v1/pets"
      pets = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(400)
      expect(pets).to be_a(Hash)
      expect(pets.count).to eq(1)
      expect(pets).to have_key(:error)
      expect(pets[:error]).to eq("Pet type not recognized")
    end
  end
end
