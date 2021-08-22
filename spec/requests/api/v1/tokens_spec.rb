require 'rails_helper'

RSpec.describe 'Api::V1::Tokens', type: :request do
  before(:all) do
    @user = create(:user)
  end

  describe 'POST /create' do
    it 'should get JWT token if valid parameters are passed' do
      post api_v1_tokens_url, params: { user: { email: @user.email, password: @user.password} }, as: :json
      expect(response).to have_http_status(:success)
    end

    it 'response should have a valid token' do
      post api_v1_tokens_url, params: { user: { email: @user.email, password: @user.password} }, as: :json
      json_response = JSON.parse(response.body)
      expect(json_response['token']).not_to be(nil)
    end

    it 'should not get JWT token if wrong parameters are passed' do
      post api_v1_tokens_url, params: { user: { email: @user.email, password: 'wrong_passW0rd$$'} }, as: :json
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
