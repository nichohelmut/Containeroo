class Customers::UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.create(user_params)
    @user.save

  end

  private
  def user_params
    params.require(:user).permit([:first_name, :last_name, :email])

  end
end
