require 'rails_helper'

RSpec.describe Activity, type: :model do
  describe 'Validation' do
    before(:all) do
      activity = create(:activity)
    end

    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title) }
    it { should validate_presence_of(:park) }
    it { should validate_presence_of(:image_url) }
    it { should validate_presence_of(:details) }
  end

  describe 'Associations' do
    it { should belong_to(:user) }
  end
end