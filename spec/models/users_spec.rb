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
end
