# frozen_string_literal: true

class Customers::ReviewsController < ApplicationController
  def index
    @reviews = policy_scope(Container)
  end

  def show
    @review = Review.find(params[:id])


    authorize @review
  end

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.create(review_params)
    @review.container = Container.find(params[:container_id])
    @review.user_id = current_user.id
    @review.save
    redirect_to customers_container_path(@review.container)
    #redirect_to customers_container_review_path(@review.container, @review)


    authorize @review
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :container_id)
  end
end
