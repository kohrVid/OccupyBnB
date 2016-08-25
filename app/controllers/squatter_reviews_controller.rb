class SquatterReviewsController < ApplicationController
  before_action :authenticate_squatter!

  def create
    @squatter_review = SquatterReview.create(squatter_review_params)
    respond_to do |format|
      if @squatter_review.save
	format.js
      end
    end
  end

  private
    def squatter_review_params
      params.require(:squatter_review).permit(:summary, :body, :reviewee_id,
					      :reviewer_id)
    end
end
