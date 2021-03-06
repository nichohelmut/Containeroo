# frozen_string_literal: true

class Customers::ContainersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show new create]
  before_action :set_paper_trail_whodunnit

  def index
    @container = Container.new
    @containers = policy_scope(Container)
    @containers = @containers.where.not(latitude: nil, longitude: nil)
    if params[:container]
      @container = Container.new(container_params)
      container_params.each do |key, value|
        if key == 'product_category' && value != ''
          @containers = @containers.where('product_category = ?', value.to_s)
        end
      end
    end

    @markers = @containers.map do |container|
      {
        lat: container.latitude,
        lng: container.longitude,
        url: "/customers/containers/#{container.id}",
        icon: {
          url: 'https://image.flaticon.com/icons/svg/603/603401.svg',
          scaledSize: {
            height: 40,
            width: 40
          }
        }
      }
    end

    @users = policy_scope(User)
    @user = User.new
    @users = User.where.not(latitude: nil, longitude: nil)
    if params[:user]
      @user = User.new(user_params)
      user_params.each do |key, value|
        key == 'address' && value != ''
      end
      end
    @user.save

    @usermarkers = [
      {
        lat: @user.latitude,
        lng: @user.longitude,
        icon: {
          url: 'https://image.flaticon.com/icons/svg/10/10522.svg',
          scaledSize: {
            height: 40,
            width: 40
          }
        }
      }
    ]

    @neighborhoods_berlin = %w[Kreuzberg Mitte Moabit PrenzlauerBerg
                               Fridrichshain Charlottenburg
                               NeuKölln Wedding Pankow Lichterfelde Schöneberg
                               Wilmersdorf Halensee
                               Rummelsburg GörlitzerPark Tegel Fridenau]
  end

  def show
    # @visit = Visit.where(user: current_user, container: @container).first
    @container = Container.find(params[:id])
    @markers =
      [{
        lat: @container.latitude,
        lng: @container.longitude,
        url: "/customers/containers/#{@container.id}",
        icon: {
          url: 'https://image.flaticon.com/icons/svg/603/603401.svg',
          scaledSize: {
            height: 40,
            width: 40
          }

        }
      }]
    @visit = Visit.new

    @users = policy_scope(User)
    @user = User.last
    @usermarkers = [
      {
        lat: @user.latitude,
        lng: @user.longitude,
        icon: {
          url: 'https://image.flaticon.com/icons/svg/10/10522.svg',
          scaledSize: {
            height: 40,
            width: 40
          }
        }
      }
    ]
    authorize @container

    @review = Review.create(params[:review])
    @review.container = @container
    @review.user_id = current_user.id
    @review.save
  end

  def new
    @container = Container.new
    authorize @container
  end

  def create
    @container = Container.create(container_params)
    @container.user = current_user
    @container.save
    redirect_to customers_containers_path(@container)
    authorize @container
  end

  private

  def container_params
    params.require(:container).permit(%i[address description supermarket user product_category photo photo_cache])
  end

  def user_params
    params.require(:user).permit(%i[address first_name email last_name password password_confirmation])
    # authorize @user
  end
end
