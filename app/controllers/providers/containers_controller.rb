class Providers::ContainersController < ApplicationController
  #skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @containers = Container.all
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
      params.require(:container).permit([:product_category, :address, :description, :supermarket, :user])


    end


  end
