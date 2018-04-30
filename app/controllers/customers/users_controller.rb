# frozen_string_literal: true

class Customers::UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def new
    @user = User.new
    authorize @user
  end

  def create
    @user = User.create(user_params)
    @user.save
    authorize @user
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.where(first_name: 'mikkel')
    @user.destroy
 end

  private

  def user_params
    params.require(:user).permit(%i[first_name last_name email address])
    authorize @user
  end
end
