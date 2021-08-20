require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'Associations' do
    it { should belong_to(:user) }
  end

  describe 'Associations' do
    it { should belong_to(:activity) }
  end
end
