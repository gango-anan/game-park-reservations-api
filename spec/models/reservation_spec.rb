require 'rails_helper'

RSpec.describe Reservation, type: :model do
  it { should validate_presence_of(:reservation_date) }

  describe 'Associations' do
    it { should belong_to(:user) }
  end

  describe 'Associations' do
    it { should belong_to(:activity) }
  end
end
