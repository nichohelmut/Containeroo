class Providers::ContainersController < ApplicationController
  #skip_before_action :authenticate_user!, only: [:index, :show]
  #before_action :authorize, :only => [:edit, :destroy]
  before_action :authenticate_user!
  def index
    #@container = Container.find(params[:id])
    #@container = Container.new(container_params)
    @containers = policy_scope(Container).order(created_at: :desc)
    @containers = Container.where.not(latitude: nil, longitude: nil)

    @markers = @containers.map do |container|
      {
        lat: container.latitude,
        lng: container.longitude
      }
    end
  end

  def show
    @container = Container.find(params[:id])
    @markers =
    [{
      lat: @container.latitude,
      lng: @container.longitude,
      icon: '/toilet-marker.png',
      draggable: false
      }]
      authorize @container
    end

  def new
    @container = Container.new
    #@user = User.find(params[:id])
    authorize @container
  end
  def create
    #@user = User.find(params[:id])
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
    #authorize @container
  end
end



