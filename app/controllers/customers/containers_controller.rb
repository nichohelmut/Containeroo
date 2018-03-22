class Customers::ContainersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @containers = policy_scope(Container).order(created_at: :desc)
    @containers = Container.where.not(latitude: nil, longitude: nil)

    @markers = @containers.map do |container|
      {
        lat: container.latitude,
        lng: container.longitude#,
      }
    end

  end
  def show
    @container = Container.find(params[:id])
  #@visit = Visit.where(user: current_user, container: @container).first
  @container = Container.find(params[:id])
  @markers =
  [{
    lat: @container.latitude,
    lng: @container.longitude,
    icon: '/toilet-marker.png',
    draggable: false
    }]
    @visit = Visit.new
    authorize @container
  end
end
