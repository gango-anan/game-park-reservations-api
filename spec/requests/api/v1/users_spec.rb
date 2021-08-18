require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  describe "GET /show" do
    before(:all) do
      @user = create(:user)
      get api_v1_user_url(@user), as: :json
      @json_response = JSON.parse(self.response.body)
    end

    it 'should show user' do
      expect(response).to have_http_status(:success)
    end

    it 'should ensure response contains the correct email' do
      expect(@user.email).to eql(@json_response['email'])
    end
  end
end
