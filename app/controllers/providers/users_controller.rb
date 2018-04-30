
# frozen_string_literal: true

class Providers::UsersController < ApplicationController
  # before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def new
    @user = User.new
    authorize @user
  end

  def create
    @user = User.create(user_params)
    @user.save
    redirect_to new_providers_container_path
    authorize @user
  end



  def destroy
    @container = Container.find(params[:container_id])
    @container.destroy
    redirect_to providers_container_user_path
  end

  private

  def user_params
    params.require(:user).permit(%i[first_name last_name email])
    authorize @user
  end
end
