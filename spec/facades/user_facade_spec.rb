require 'rails_helper'

RSpec.describe UserFacade, type: :model do
  before :each do
    seed_test_db
  end

  describe "class methods" do
    describe ".get_all_user_data"
    it "returns a user and its pets, favorites, and applications if a valid email is provided" do
      user = @users.first
      data = UserFacade.get_all_user_data(user.email)

      expect(data).to be_a(OpenStruct)
      expect(data.id).to eq(user.id)
      expect(data.username).to eq(user.username)
      expect(data.email).to eq(user.email)
      expect(data.pets).to be_an(Array)
      expect(data.pets.first).to be_a(Hash)
      expect(data.pets.first.keys).to eq([ :id, :type, :attributes])
      expect(data.pets.first[:id]).to eq(@users.first.pets.first.id)
      expect(data.pets.first[:type]).to eq("pet")
      expect(data.pets.first[:attributes].keys).to eq([:user_id, :name, :age, :pet_type, :breed, :description, :gender, :fixed, :house_trained, :photo_url_1, :photo_url_2, :photo_url_3, :good_with_kids, :good_with_animals, :created_at, :updated_at])
      expect(data.applications).to eq(user.applications)
      expect(data.favorites).to be_an(Array)
      expect(data.favorites.first).to be_a(Hash)
      expect(data.favorites.first.keys).to eq([ :id, :type, :attributes])
      expect(data.favorites.first[:id]).to eq(@users.second.pets.first.id)
      expect(data.favorites.first[:type]).to eq("pet")
      expect(data.favorites.first[:attributes].keys).to eq([:user_id, :name, :age, :pet_type, :breed, :description, :gender, :fixed, :house_trained, :photo_url_1, :photo_url_2, :photo_url_3, :good_with_kids, :good_with_animals, :created_at, :updated_at])
      expect(data.pet_applications).to eq([@users.second.applications.second, @users.second.applications.first])
    end

    it "returns a error object if an invalid email is provided" do
      data = UserFacade.get_all_user_data("not@email.com")

      expect(data).to be_a(OpenStruct)
      expect(data.error).to eq("invalid email")
    end

    it "returns a error object if no email is provided" do
      data = UserFacade.get_all_user_data(nil)

      expect(data).to be_a(OpenStruct)
      expect(data.error).to eq("email required")
    end
  end
end
