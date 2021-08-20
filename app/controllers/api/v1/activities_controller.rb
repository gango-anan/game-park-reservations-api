class Api::V1::ActivitiesController < ApplicationController
  before_action :check_login_status, only: %i[create]

  def index
    render json: Activity.all
  end

  def show
    render json: Activity.find(params[:id])
  end

  def create
    activity = current_user.activities.build(activity_params)
    if activity.save
      render json: activity, status: :created
    else
      render json: { errors: activity.errors }, status: :unprocessable_entity
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :park, :image_url, :details, :user_id )
  end
end
