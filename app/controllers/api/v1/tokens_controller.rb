class Api::V1::TokensController < ApplicationController
  def create
    @user = User.find_by_email(user_params[:email])
    if @user&.authenticate(user_params[:password])
      render json: {
        user: {
          id: @user.id,
          token: JsonWebToken.encode(user_id: @user.id),
          email: @user.email,
          username: @user.username,
          admin: @user.admin
        }
      }
    else
      render json: "Invalid email or password!" , status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
