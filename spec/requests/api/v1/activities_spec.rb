require 'rails_helper'

RSpec.describe "Api::V1::Activities", type: :request do
  before(:all) do
    @activity = create(:activity)
    @activity_two = create(:activity)
    @activity_three = create(:activity)
    @user_two = create(:user)
  end

  describe "GET /activity" do
    it 'should show an activity' do
      get api_v1_activity_url(@activity), as: :json
      json_response = JSON.parse(self.response.body, symbolize_names: true)
      expect(response).to have_http_status(:success)
      expect(@activity.title).to eql(json_response.dig(:data, :attributes, :title))
    end
  end

  describe "GET /activities" do
    it 'should show an activities' do
      get api_v1_activities_url, as: :json
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /activities" do
    it 'should successfully create an activity' do
      post api_v1_activities_url,
      params: { 
        activity: { 
          title: 'new title',
          park: @activity.park,
          image_url: @activity.image_url,
          details: @activity.details
        }
      },
      headers: { Authorization: JsonWebToken.encode(user_id: @user_two.id) },
      as: :json

      expect(response).to have_http_status(:created)
    end

    it 'should increase the number of activities by one' do
      expect do
        post api_v1_activities_url,
        params: { 
          activity: { 
            title: 'another title',
            park: @activity.park,
            image_url: @activity.image_url,
            details: @activity.details
          }
        },
        headers: { Authorization: JsonWebToken.encode(user_id: @user_two.id) },
        as: :json
      end.to change(Activity, :count).by(1)
    end

    it 'should forbid creating an activity by unauthorized user' do
      post api_v1_activities_url,
      params: { 
        activity: { 
          title: 'another new title',
          park: @activity.park,
          image_url: @activity.image_url,
          details: @activity.details
        }
      }, as: :json
      expect(response).to have_http_status(:forbidden)
    end
  end

  describe "PATCH /activity" do
    it 'should successfully an activity' do
      patch api_v1_activity_url(@activity),
      params: { 
        activity: { 
          title: @activity.title,
          park: 'Kidepo NP',
          image_url: @activity.image_url,
          details: @activity.details,
        }
      },
      headers: { Authorization: JsonWebToken.encode(user_id: @user_two.id) },
      as: :json

      expect(response).to have_http_status(:success)
    end

    it 'should forbid updating an activity by unauthorized user' do
      patch api_v1_activity_url(@activity),
      params: { 
        activity: { 
          title: @activity.title,
          park: @activity.park,
          image_url: @activity.image_url,
          details: @activity.details
        }
      }
      expect(response).to have_http_status(:forbidden)
    end
  end

  describe "DELETE /activity" do
    it 'should successfully delete activity' do
      delete api_v1_activity_url(@activity),
        headers: { Authorization: JsonWebToken.encode(user_id: @user_two.id) },
        as: :json
      expect(response).to have_http_status(:no_content)
    end

    it 'should reduce the number of activities by 1' do
      expect do
        delete api_v1_activity_url(@activity_two),
        headers: { Authorization: JsonWebToken.encode(user_id: @user_two.id) },
        as: :json
      end.to change(Activity, :count).by(-1)
    end

    it 'should forbid unauthorized user from deleting an activity' do
      delete api_v1_activity_url(@activity_three)
      expect(response).to have_http_status(:forbidden)
    end
  end
end
