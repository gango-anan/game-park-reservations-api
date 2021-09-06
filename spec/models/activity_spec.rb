require 'rails_helper'

RSpec.describe Activity, type: :model do
  describe 'Validation' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:park) }
    it { should validate_presence_of(:image_url) }
    it { should validate_presence_of(:details) }
  end

  describe 'Associations' do
    it { should have_many(:users) }
  end

  describe 'Associations' do
    it { should have_many(:reservations) }
  end
end
