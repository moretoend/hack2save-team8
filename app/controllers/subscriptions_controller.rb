class SubscriptionsController < ApplicationController

  #{"organization_id"=>"1", "job_id"=>"1"}
  def index
    @pending = Subscription.with_status(:pending).where(job_id: params[:job_id])
    @accepted = Subscription.with_status(:accepted).where(job_id: params[:job_id])
    @denied = Subscription.with_status(:denied).where(job_id: params[:job_id])
    @canceled = Subscription.with_status(:canceled).where(job_id: params[:job_id])
  end

  def show
  end

  def accept
    @subscriptions = Subscription.find(params[:id])
    @subscriptions.update_attributes(status: :accepted)
    redirect_to organization_job_subscriptions_url(@subscriptions.job.organization,@subscriptions.job) , notice: "Subscription updated"
  end

  def decline
    @subscriptions = Subscription.find(params[:id])
    @subscriptions.update(status: :declined)
    redirect_to organization_job_subscriptions_url(@subscriptions.job.organization,@subscriptions.job) , notice: "Subscription updated"
  end

  def destroy
    @subscriptions = Subscription.find(params[:id])
    @subscriptions.update(status: :cancel)
    redirect_to organization_job_subscriptions_url(@subscriptions.job.organization,@subscriptions.job) , notice: "Subscription updated"
  end

  #TODO Set params permit
  private
    def subscription_params
      params.require(:subscription).permit(:user_id)
    end
end
