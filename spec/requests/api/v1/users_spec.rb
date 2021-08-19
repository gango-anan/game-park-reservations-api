require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  before(:all) do
    @user = create(:user)
    @user_two = create(:user)
  end

  describe "GET /show" do
    before(:each) do
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

  describe "POST /create" do
    it 'should successfully create a user' do
      post api_v1_users_url, params: { user: { username: 'testname', email: 'testemail@test.co.ug', password: 'password', password_confirmation: 'password'} } ,as: :json
      expect(response).to have_http_status(:created)
    end

    it 'should increase the number of users by 1' do
      expect do
        post api_v1_users_url, params: { user: { username: 'testname2', email: 'testemail2@test.co.ug', password: 'password', password_confirmation: 'password'} } ,as: :json
      end.to change(User, :count).by(1)
    end

    it 'should not create a user with a taken email' do
      post api_v1_users_url, params: { user: { username: 'testname2', email: @user.email, password: 'password', password_confirmation: 'password'} } ,as: :json
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "PATCH /update" do
    it 'should successfully update a user' do
      patch api_v1_user_url(@user), params: { user: { username: 'testname', email: 'testedmail@test.co.ug', password: 'password', password_confirmation: 'password'} } ,as: :json
      expect(response).to have_http_status(:success)
    end

    it 'should not update user when invalid params are sent' do
      patch api_v1_user_url(@user), params: { user: { username: 'testname2', email: 'wrong_email', password: 'password', password_confirmation: 'password'} } ,as: :json
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "DELETE /destroy" do
    it 'should successfully delete a user' do
      delete api_v1_user_url(@user), as: :json
      expect(response).to have_http_status(:no_content)
    end

    it 'should reduce the number of users by 1' do
      expect do
        delete api_v1_user_url(@user_two), as: :json
      end.to change(User, :count).by(-1)
    end
  end
end
