class Api::V1::ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show update destroy]
  before_action :check_login_status, only: %i[index create]
  before_action :check_ownership, only: %i[update destroy]

  def index
    reservations = current_user.reservations.includes(:activity).all
    render json: ReservationSerializer.new(reservations).serializable_hash
  end

  def show
    render json: ReservationSerializer.new(@reservation).serializable_hash
  end

  def create
    reservation = current_user.reservations.build(reservation_params)
    if reservation.save
      render json: ReservationSerializer.new(reservation).serializable_hash, status: :created
    else
      render json: { errors: reservation.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @reservation.update(reservation_params)
      render json: ReservationSerializer.new(@reservation).serializable_hash
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation.destroy
    head 204
  end

  private

  def reservation_params
    params.require(:reservation).permit(:user_id, :activity_id, :reservation_date )
  end

  def check_ownership
    head :forbidden unless @reservation.user_id == current_user&.id
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
end
