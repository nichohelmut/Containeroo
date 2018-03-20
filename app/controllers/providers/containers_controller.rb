class Providers::ContainersController < ApplicationController
  #skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @containers = Container.all
    @containers = Container.where.not(latitude: nil, longitude: nil)

    @markers = @containers.map do |container|
      {
        lat: container.latitude,
        lng: container.longitude#,
        # infoWindow: { content: render_to_string(partial: "/containers/map_box", locals: { container: container }) }
      }
  end
end

  def show
    @container = Container.find(params[:id])


  end

  def new

    @container = Container.new
    #@user = User.find(params[:id])
  end
  def create
    #@user = User.find(params[:id])
    @container = Container.create(container_params)
    @container.user = current_user
    if @container.save
      redirect_to providers_container_path(@container)
    else
      :new
    end
  end

    def update

    end

    private
    def container_params
      params.require(:container).permit(:address, :description, :supermarket, :user, :product_category)


    end


  end
