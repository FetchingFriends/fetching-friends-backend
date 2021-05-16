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
      expect(data.pets).to eq(user.pets)
      expect(data.applications).to eq(user.applications)
      expect(data.favorites).to eq([@users.second.pets.first, @users.second.pets.last])
      expect(data.pet_applications).to eq([@users.second.applications.second, @users.second.applications.first])
    end
  end
end
