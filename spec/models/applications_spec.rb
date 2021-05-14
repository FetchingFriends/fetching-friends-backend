require 'rails_helper'

RSpec.describe Application, type: :model do
  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :pet }
  end

  describe 'validations' do
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:description) }
    it { should define_enum_for(:status).with_values([:pending, :interested, :denied]) }
  end
end
