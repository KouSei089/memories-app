class Api::UsersController < ApplicationController

  def index
    @users = User.order("created_at DESC")
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params) 
    if @user.save
      session[:user_id] = @user.id
      render :show, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.fetch(:user, {}).permit(:name, :email, :password, :password_confirmation)
    end
end
