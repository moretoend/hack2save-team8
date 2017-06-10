class UserReviewsController < ReviewsController

  def edit
    load_review
  end


  private


  def update_location
    organization_job_subscriptions_path(@review.subscription.job.organization, @review.subscription.job)
  end
end
