class OrganizationReviewsController < ReviewsController

  def edit
    load_review
  end


  private


  def update_location
    user_subscriptions_path
  end

end
