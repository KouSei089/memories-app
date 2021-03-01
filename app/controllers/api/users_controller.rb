class Api::UsersController < ApplicationController

  def index
    @users = User.order("created_at DESC")
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new
  end
end
