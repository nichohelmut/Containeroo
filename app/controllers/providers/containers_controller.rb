class Providers::ContainersController < ApplicationController
  before_action :authenticate_user!
  def index

    @containers = policy_scope(Container).order(created_at: :desc)
    @containers = Container.where.not(latitude: nil, longitude: nil)
    @markers = @containers.map do |container|
      {
        lat: container.latitude,
        lng: container.longitude
      }
    end

    @users = policy_scope(User)
    @user = User.new
    @users = User.where.not(latitude: nil, longitude: nil)

    @user_markers = @users.map do |user|
      {
        lat: user.latitude,
      lng: user.longitude#,

    }
  end


  end

  def show
    @container = Container.find(params[:id])
    @markers =
    [{
      lat: @container.latitude,
      lng: @container.longitude,
      icon: '/logo.png',
      draggable: false
      }]
       @users = policy_scope(User)
    @user = User.new
    @users = User.where.not(latitude: nil, longitude: nil)

    @user_markers = @users.map do |user|
      {
        lat: user.latitude,
      lng: user.longitude#,

    }
  end
      authorize @container
  end

  def new
    @container = Container.new
    authorize @container
  end

  def create
    @container = Container.create(container_params)
    @container.user = current_user
    @container.save
    redirect_to providers_container_path(@container)
    authorize @container
  end

  def update
  end

  def destroy
    @container = Container.find(params[:id])
    @container.user = current_user
    @container.destroy
    redirect_to providers_container_path
    authorize @container
  end

  private
  def container_params
    params.require(:container).permit(:address, :description, :supermarket, :user, :product_category, :photo, :photo_cache)
  end
end



