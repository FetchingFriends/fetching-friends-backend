require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many :pets }
    it { should have_many :favorites }
    it { should have_many :applications }
  end
end