class Api::V1::ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[show update destroy]
  before_action :check_login_status, only: %i[create]
  before_action :check_ownership, only: %i[update destroy]

  def index
    @activities = Activity.all
    render json: ActivitySerializer.new(@activities).serializable_hash
  end

  def show
    render json: ActivitySerializer.new(@activity).serializable_hash
  end

  def create
    activity = current_user.activities.build(activity_params)
    if activity.save
      render json: ActivitySerializer.new(activity).serializable_hash, status: :created
    else
      render json: { errors: activity.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @activity.update(activity_params)
      render json: ActivitySerializer.new(@activity).serializable_hash
    else
      render json: @activity.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @activity.destroy
    head 204
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :park, :image_url, :details, :user_id )
  end

  def check_ownership
    head :forbidden unless @activity.user_id == current_user&.id
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end
end
