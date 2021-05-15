require 'rails_helper'

RSpec.describe 'Create a pet request' do
  describe 'happy path' do
    it 'can create a pet' do
      user = create(:user)
      pet_params = { user_id: user.id,
                     name: 'Spot',
                     age: 1,
                     pet_type: :dog,
                     breed: 'Lab',
                     description: 'Good boy',
                     gender: 'Male',
                     fixed: true,
                     house_trained: true,
                     good_with_kids: true,
                     good_with_animals: false,
                     photo_url_1: 'url_address_1',
                     photo_url_2: 'url_address_2',
                     photo_url_3: 'url_address_3'}

      headers = {"CONTENT_TYPE" => "application/json",
                 "ACCEPT"       => "application/json"}

      post '/api/v1/pets', headers: headers, params: pet_params.to_json

      new_pet = Pet.last
      new_pet_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(response.content_type).to eq("application/json")
      expect(new_pet_json).to be_a(Hash)
      expect(new_pet_json[:data]).to be_a(Hash)
      expect(new_pet_json[:data].keys).to eq([:id, :type, :attributes])
      expect(new_pet_json[:data][:id]).to be_a(String)
      expect(new_pet_json[:data][:type]).to eq('pet')
      expect(new_pet_json[:data][:attributes].count).to eq(14)
      expect(new_pet_json[:data][:attributes].keys).to eq([:user_id, :name, :age, :pet_type, :breed, :description, :gender, :fixed, :house_trained, :good_with_kids, :good_with_animals, :photo_url_1, :photo_url_2, :photo_url_3])
      expect(new_pet_json[:data][:attributes][:user_id]).to eq(user.id)
      expect(new_pet_json[:data][:attributes][:name]).to eq(pet_params[:name])
      expect(new_pet_json[:data][:attributes][:age]).to eq(pet_params[:age])
      expect(new_pet_json[:data][:attributes][:pet_type]).to eq(pet_params[:pet_type].to_s)
      expect(new_pet_json[:data][:attributes][:breed]).to eq(pet_params[:breed])
      expect(new_pet_json[:data][:attributes][:description]).to eq(pet_params[:description])
      expect(new_pet_json[:data][:attributes][:gender]).to eq(pet_params[:gender])
      expect(new_pet_json[:data][:attributes][:fixed]).to eq(pet_params[:fixed])
      expect(new_pet_json[:data][:attributes][:house_trained]).to eq(pet_params[:house_trained])
      expect(new_pet_json[:data][:attributes][:good_with_kids]).to eq(pet_params[:good_with_kids])
      expect(new_pet_json[:data][:attributes][:good_with_animals]).to eq(pet_params[:good_with_animals])
      expect(new_pet_json[:data][:attributes][:photo_url_1]).to eq(pet_params[:photo_url_1])
      expect(new_pet_json[:data][:attributes][:photo_url_2]).to eq(pet_params[:photo_url_2])
      expect(new_pet_json[:data][:attributes][:photo_url_3]).to eq(pet_params[:photo_url_3])
    end

    it 'can create a pet with default values' do
      user = create(:user)
      pet_params = { user_id: user.id,
                     name: 'Spot',
                     age: 1,
                     pet_type: :dog,
                     breed: 'Lab',
                     description: 'Good boy',
                     gender: 'Male',
                     photo_url_1: 'url_address_1',
                     photo_url_2: 'url_address_2',
                     photo_url_3: 'url_address_3'}

      headers = {"CONTENT_TYPE" => "application/json",
                 "ACCEPT"       => "application/json"}

      post '/api/v1/pets', headers: headers, params: pet_params.to_json

      new_pet = Pet.last
      new_pet_json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(response.content_type).to eq("application/json")
      expect(new_pet_json).to be_a(Hash)
      expect(new_pet_json[:data]).to be_a(Hash)
      expect(new_pet_json[:data].keys).to eq([:id, :type, :attributes])
      expect(new_pet_json[:data][:id]).to be_a(String)
      expect(new_pet_json[:data][:type]).to eq('pet')
      expect(new_pet_json[:data][:attributes].count).to eq(14)
      expect(new_pet_json[:data][:attributes][:fixed]).to eq(false)
      expect(new_pet_json[:data][:attributes][:house_trained]).to eq(false)
      expect(new_pet_json[:data][:attributes][:good_with_kids]).to eq(false)
      expect(new_pet_json[:data][:attributes][:good_with_animals]).to eq(false)
    end
  end
end
