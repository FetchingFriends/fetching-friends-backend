require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many :pets }
    it { should have_many :favorites }
    it { should have_many :applications }
  end

  describe 'validations' do
    it { should validate_presence_of :username }
    it { should validate_uniqueness_of :username }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }

    it 'return an error if the email is not in the correct format' do
      user = User.create(username: 'bobgu',
                         email: "Not an email")

      expect(user.errors[:email].to_sentence).to eq("is invalid")
    end
  end

  describe 'class methods' do
    before :each do
      user = create(:user)
      (5).times do
        create(:pet, user: user)
      end
    end

    it 'user_pets' do
      user_id = User.first.id
      user_pets =  User.user_pets(user_id)

      expect(user_pets.count).to eq(5)
      user_pets.each do |pet|
        expect(pet).to be_a(Pet)
      end
    end
  end
end
