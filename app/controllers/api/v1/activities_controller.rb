class Api::V1::ActivitiesController < ApplicationController
  def show
    render json: Activity.find(params[:id])
  end
end
