class ReviewsController < ApplicationController
  before_action :require_login

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.product_id = params[:product_id]

    if @review.save
      redirect_to request.referrer
    else
      redirect_to request.referrer
    end
  end

  def destroy
    puts params
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to "/products/#{params[:product_id]}"
  end

  private
  def require_login
    unless current_user
      flash[:error] = "You must be logged in to access this section"
      redirect_to '/login'
    end
  end

  def review_params
    params.require(:review).permit(
      :rating,
      :description
    )
  end

end
