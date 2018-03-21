class Customers::UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def new
    @user = User.new
  end
  def create
    @user = User.create(user_params)
    @user.save
  end

  def show
    @user = User.find(params[:id])

  end

  #  def destroy
  #   @container = Container.find(params[:id])
  #   @container.user = @container
  #   @container.destroy
  #   redirect_to providers_container_path

  # end

  private
  def user_params
    params.require(:user).permit([:first_name, :last_name, :email])

  end
end
