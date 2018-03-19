class Customers::ContainersController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]
def index
  @containers = Container.all

end
def show
  @container = Container.find(params[:id])
  #@visit = Visit.where(user: current_user, container: @container).first
  @visit = Visit.new
end
end
