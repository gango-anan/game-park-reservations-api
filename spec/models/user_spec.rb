require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validation' do
    before(:all) do
      first_user = create(:user)
    end

    it { should validate_presence_of(:username) }
    it { should validate_length_of(:username).is_at_least(3) }
  
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should allow_value('testemail@emailaddress.foo').for(:email) }
    it { should_not allow_value('testemail').for(:email) }
  
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_least(8) }
  end

  describe 'Associations' do
    it { should have_many(:activities) }
  end

end
