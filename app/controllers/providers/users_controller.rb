class Providers::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])

  end

  def new
    @user = User.new
  end
  def create
    @user = User.create(user_params)
    @user.save
    redirect_to new_providers_container_path

  end

  private
  def user_params
    params.require(:user).permit([:first_name, :last_name, :email])

  end
end
