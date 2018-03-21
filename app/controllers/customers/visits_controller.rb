class Customers::VisitsController < ApplicationController
  before_action :set_container
  def index
    @visits = Visit.all

  end

  def show

    #@user = User.find(params[:user_id])
    @visit = Visit.find(params[:id])
    @container = @visit.container

  #@visit = Visit.where(user: current_user, container: @container).first
  #@visit.container = Container.find(params[:id])
  @markers =
  [{
    lat: @visit.container.latitude,
    lng: @visit.container.longitude,
    icon: '/toilet-marker.png',
    draggable: false
    }]
  end

  def new
    @visit = Visit.new
    @visit.user = current_user
  end

  def create
    @visit = Visit.new(visit_params)
    @visit.user_id = current_user.id
    @visit.container = @container
    @visit.save
    redirect_to customers_container_visit_path(@visit.container, @visit)

  end

  private

  def set_container
    @container = Container.find(params[:container_id])

  end
  def visit_params
    params.require(:visit).permit(:user, :container_id)

  end
end
