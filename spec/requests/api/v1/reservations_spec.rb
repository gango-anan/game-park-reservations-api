require 'rails_helper'

RSpec.describe "Api::V1::Reservations", type: :request do
  before(:all) do
    @reservation = create(:reservation)
    @reservation_two = create(:reservation)
    @reservation_three = create(:reservation)
    @new_activity = create(:activity)
    @another_activity = create(:activity)
    @new_user = create(:user)
  end

  describe "GET /reservation" do
    it 'should show a reservation' do
      get api_v1_reservation_url(@reservation),
      headers: { Authorization: JsonWebToken.encode(user_id: @reservation.user_id) },
      as: :json
      json_response = JSON.parse(self.response.body, symbolize_names: true)
      expect(response).to have_http_status(:success)
      expect(@reservation.activity.title).to eql(json_response.dig(:data, :attributes, :activity, :title))
    end
  end

  describe "GET /reservations" do
    it 'should show all reservations' do
      get api_v1_reservations_url,
      headers: { Authorization: JsonWebToken.encode(user_id: @new_user.id) },
      as: :json
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /reservations" do
    it 'should successfully create a reservation' do
      post api_v1_reservations_url,
      params: { 
        reservation: { 
          user_id: @new_user.id,
          activity_id: @new_activity.id,
          reservation_date: '2022-12-12'
        }
      },
      headers: { Authorization: JsonWebToken.encode(user_id: @new_user.id) },
      as: :json

      expect(response).to have_http_status(:created)
    end

    it 'should increase the number of reservations by one' do
      expect do
        post api_v1_reservations_url,
        params: { 
          reservation: { 
            user_id: @new_user.id,
            activity_id: @another_activity.id,
            reservation_date: '2022-11-10'
          }
        },
        headers: { Authorization: JsonWebToken.encode(user_id: @new_user.id) },
        as: :json
      end.to change(Reservation, :count).by(1)
    end

    it 'should forbid creating a reservation by unauthorized user' do
      test_activity = create(:activity)
      post api_v1_reservations_url,
      params: { 
        reservation: { 
          user_id: @new_user.id,
          activity_id: test_activity.id,
          reservation_date: '2022-11-10'
        }
      }
      expect(response).to have_http_status(:forbidden)
    end
  end

  describe "PATCH /reservation" do
    it 'should successfully update a reservation' do
      updating_activity = create(:activity)
      updating_date = '2023-07-07'
      patch api_v1_reservation_url(@reservation),
      params: { 
        reservation: { 
          user_id: @reservation.user_id,
          activity_id: updating_activity.id,
          reservation_date: updating_date
        }
      },
      headers: { Authorization: JsonWebToken.encode(user_id: @reservation.user_id) },
      as: :json

      expect(response).to have_http_status(:success)
    end

    it 'should forbid updating a reservation by unauthorized user' do
      patch api_v1_reservation_url(@reservation),
      params: { 
        reservation: { 
          user_id: @reservation.user_id,
          activity_id: @another_activity.id,
          reservation_date: '2024-10-10'
        }
      }
      expect(response).to have_http_status(:forbidden)
    end
  end

  describe "DELETE /reservation" do
    it 'should successfully delete a reservation' do
      delete api_v1_reservation_url(@reservation),
        headers: { Authorization: JsonWebToken.encode(user_id: @reservation.user_id) },
        as: :json
      expect(response).to have_http_status(:no_content)
    end

    it 'should reduce the number of activities by 1' do
      expect do
        delete api_v1_reservation_url(@reservation_two),
        headers: { Authorization: JsonWebToken.encode(user_id: @reservation_two.user_id) },
        as: :json
      end.to change(Reservation, :count).by(-1)
    end

    it 'should forbid unauthorized user from deleting a reservation' do
      delete api_v1_reservation_url(@reservation_three),
      headers: { Authorization: JsonWebToken.encode(user_id: @new_user.id) },
      as: :json
      expect(response).to have_http_status(:forbidden)
    end
  end
end
