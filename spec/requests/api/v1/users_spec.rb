require 'rails_helper'

RSpec.describe 'Api::V1::Users', type: :request do
  before(:all) do
    @user = create(:user)
    @user_two = create(:user)
    @user_three = create(:user)
  end

  describe 'GET /user' do
    before(:each) do
      get api_v1_user_url(@user), as: :json
      @json_response = JSON.parse(response.body, symbolize_names: true)
    end

    it 'should show user' do
      expect(response).to have_http_status(:success)
    end

    it 'should ensure response contains the correct user email' do
      expect(@user.email).to eql(@json_response.dig(:data, :attributes, :email))
    end
  end

  describe 'GET /users' do
    it 'should show all users' do
      get api_v1_users_url, as: :json
      @json_response = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /register' do
    it 'should successfully create a user' do
      post api_v1_register_url,
           params: {
             user: {
               username: 'testname',
               email: 'testemail@test.co.ug',
               password: 'password',
               password_confirmation: 'password'
             }
           }, as: :json
      expect(response).to have_http_status(:created)
    end

    it 'should increase the number of users by 1' do
      expect do
        post api_v1_register_url,
             params: {
               user: {
                 username: 'testname2',
                 email: 'testemail2@test.co.ug',
                 password: 'password',
                 password_confirmation: 'password'
               }
             }, as: :json
      end.to change(User, :count).by(1)
    end

    it 'should not create a user with a taken email' do
      post api_v1_register_url,
           params: {
             user: {
               username: 'testname2',
               email: @user.email,
               password: 'password',
               password_confirmation: 'password'
             }
           }, as: :json
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'PATCH /update' do
    it 'should update user' do
      patch api_v1_user_url(@user),
            params: { user: { username: @user.username, email: @user.email, password: 'newpassword',
                              password_confirmation: 'newpassword' } },
            headers: { Authorization: JsonWebToken.encode(user_id: @user.id) },
            as: :json
      expect(response).to have_http_status(:success)
    end

    it 'should not update user when invalid params are sent' do
      patch api_v1_user_url(@user),
            params: { user: { email: 'wrong_email' } },
            headers: { Authorization: JsonWebToken.encode(user_id: @user.id) },
            as: :json
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'should forbid unauthorized user from performing update' do
      patch api_v1_user_url(@user), params: { user: { email: @user.email } }, as: :json
      expect(response).to have_http_status(:forbidden)
    end
  end

  describe 'DELETE /destroy' do
    it 'should successfully delete a user' do
      delete api_v1_user_url(@user),
             headers: { Authorization: JsonWebToken.encode(user_id: @user.id) },
             as: :json
      expect(response).to have_http_status(:no_content)
    end

    it 'should reduce the number of users by 1' do
      expect do
        delete api_v1_user_url(@user_two),
               headers: { Authorization: JsonWebToken.encode(user_id: @user_two.id) },
               as: :json
      end.to change(User, :count).by(-1)
    end

    it 'should forbid unauthorized user from deleting a user' do
      delete api_v1_user_url(@user_three)
      expect(response).to have_http_status(:forbidden)
    end
  end
end
