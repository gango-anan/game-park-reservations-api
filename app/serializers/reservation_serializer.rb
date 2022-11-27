class ReservationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :reservation_date, :user_id, :activity_id, :activity
end
