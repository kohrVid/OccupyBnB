class AbodeReviewsController < ApplicationController
  before_action :authenticate_squatter!

  def create
    @abode_review = AbodeReview.create(abode_review_params)
    respond_to do |format|
      if @abode_review.save
	format.js
      end
    end
  end

  private
    def abode_review_params
      params.require(:abode_review).permit(:summary, :body, :abode_id, 
					   :squatter_id)
    end
end
