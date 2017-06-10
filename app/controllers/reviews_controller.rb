class ReviewsController < ApplicationController

  def update
    load_review
    @review.attributes = review_attributes
    if @review.save
      respond_with @review, location: -> { update_location }
    else
      render :edit
    end
  end


  private


  def review_attributes
    params.require(:review).permit(:id, :organization_grade, :organization_notes, :volunteer_grade, :volunteer_notes)
  end


  def load_review
    @review = Review.find(params[:id])
  end
end
