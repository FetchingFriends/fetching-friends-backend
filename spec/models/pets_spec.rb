require 'rails_helper'

RSpec.describe Pet, type: :model do
  describe 'relationships' do
    it { should belong_to :user }
    it { should have_many :favorites }
    it { should have_many :applications }
  end
end
