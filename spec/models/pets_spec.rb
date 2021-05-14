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
    it { should validate_presence_of :type }
    it { should validate_presence_of :description }
    it { should validate_presence_of :gender }
    it { should validate_presence_of :photo_url_1 }
    it { should validate_numericality_of(:age).is_greater_than_or_equal_to(0) }
    it { should define_enum_for(:type).with_values([:other, :dog, :cat]) }
  end
end
