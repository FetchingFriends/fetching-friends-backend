require 'rails_helper'

RSpec.describe Pet, type: :model do
  describe 'relationships' do
    it { should belong_to :user }
    it { should have_many :favorites }
    it { should have_many :applications }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :pet_type }
    it { should validate_presence_of :description }
    it { should validate_presence_of :gender }
    it { should validate_presence_of :photo_url_1 }
    it { should validate_numericality_of(:age).is_greater_than_or_equal_to(0) }
    it { should define_enum_for(:pet_type).with_values([:other, :dog, :cat]) }
  end

  describe 'class methods' do
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

    it 'search' do
      expect(Pet.search("cats").count).to eq(3)
      expect(Pet.search("others").count).to eq(6)
      expect(Pet.search("dogs").count).to eq(5)
      expect(Pet.search(nil)).to eq(nil)
    end

    it 'assign_enum' do
      expect(Pet.assign_enum("cats")).to eq(2)
      expect(Pet.assign_enum("cat")).to eq(2)
      expect(Pet.assign_enum("others")).to eq(0)
      expect(Pet.assign_enum("other")).to eq(0)
      expect(Pet.assign_enum("dogs")).to eq(1)
      expect(Pet.assign_enum("dog")).to eq(1)
      expect(Pet.assign_enum("frogs")).to eq(nil)
      expect(Pet.assign_enum(nil)).to eq(nil)
    end

    it 'check_plural' do
      expect(Pet.check_plural?("cAtS")).to eq("cat")
      expect(Pet.check_plural?("CAt")).to eq("cat")
      expect(Pet.check_plural?("oTHers")).to eq("other")
      expect(Pet.check_plural?("otHeR")).to eq("other")
      expect(Pet.check_plural?("DOGS")).to eq("dog")
      expect(Pet.check_plural?("dOg")).to eq("dog")
      expect(Pet.check_plural?("FROgS")).to eq("frog")
      expect(Pet.check_plural?("")).to eq("")
      expect(Pet.check_plural?(123)).to eq("123")
    end
  end
end
