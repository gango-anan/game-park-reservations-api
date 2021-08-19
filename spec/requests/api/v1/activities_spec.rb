require 'rails_helper'

RSpec.describe "Api::V1::Activities", type: :request do
  before(:all) do
    @activity = create(:activity)
    get api_v1_activity_url(@activity), as: :json
    @json_response = JSON.parse(self.response.body)
  end

  describe "GET /show" do
    it 'should show an activity' do
      expect(response).to have_http_status(:success)
      expect(@activity.title).to eql(@json_response['title'])
    end
  end
end
