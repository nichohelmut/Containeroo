class Customers::VisitsController < ApplicationController
  before_action :set_container


  def index
    @visits = policy_scope(Visit).order(created_at: :desc)
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
    url:  "/customers/containers/#{@container.id}/visits/#{@visit.id}",
    icon: {
          url: "https://image.flaticon.com/icons/svg/603/603401.svg",
          scaledSize: {
            height: 40,
            width: 40
          }

        }
    }]

    @users = policy_scope(User)
    @user = User.last
    # @users = User.where.not(latitude: nil, longitude: nil)
    # if params[:user]
    #   @user = User.new(user_params)
    #   user_params.each do |key, value|
    #     if key == "address" && value != ""
    #       @users = @users.where('address = ?', "#{value}")
    #     end
    #   end
    # end


    @usermarkers = [
      {
      lat: @user.latitude,
      lng: @user.longitude#,

    }]
    authorize @visit
  end

  def new
    @visit = Visit.new
    @visit.user = current_user
    authorize @visit
  end

  def create
    @visit = Visit.new(visit_params)
    @visit.user_id = current_user.id
    @visit.container = @container
    @visit.save
    redirect_to customers_container_visit_path(@visit.container, @visit)
    authorize @visit
  end

  private

  def set_container
    @container = Container.find(params[:container_id])
  end

  def visit_params
    params.require(:visit).permit(:user, :container_id)
  end
end
