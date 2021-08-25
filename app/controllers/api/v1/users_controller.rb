class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]
  before_action :check_ownership, only: %i[update destroy]

  def index
    @users = User.all
    render json: UserSerializer.new(@users).serializable_hash
  end

  def show
    render json: UserSerializer.new(@user).serializable_hash
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: {
        user: {
          admin: @user.admin,
          username: @user.username,
          email: @user.email,
          token: JsonWebToken.encode(user_id: @user.id)
        }
      }, status: :created
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: UserSerializer.new(@user).serializable_hash, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    head 204
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :admin).with_defaults(admin: false)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def check_ownership
    head :forbidden unless @user.id == current_user&.id
  end
end
