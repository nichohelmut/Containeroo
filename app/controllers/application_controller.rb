class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  include Pundit


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

  private
  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  # def after_sign_in_path_for(providers)
  #    new_providers_container_path
  # end

  # def after_sign_in_path_for(resources)
  #   # "customers/containers/:container_id/visits"

  #   customers_container_visit_path(@visit.id, @user)
  # end

  # private

  # def visit_params
  #   params.require(:visit).permit(:user, :container_id)
  # end


end
