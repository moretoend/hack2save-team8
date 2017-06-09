class SubscriptionsController < ApplicationController

  #{"organization_id"=>"1", "job_id"=>"1"}
  def index
    @pending = Subscription.where(job_id: params[:job_id])
  end

  def show
  end

  def accept
    @subscriptions = Subscription.find(params[:id])
    @subscriptions.update_attributes(user_id: params[:user_id], status: :accept)
    redirect_to organization_job_subscriptions_url(@subscriptions.job.organization,@subscriptions.job) , notice: "Subscription updated"
  end

  def decline
    @subscriptions = Subscription.find(params[:id])
    @subscriptions.update(id: params[:id], user_id: params[:user_id], status: :declined)
    redirect_to organization_job_subscriptions_url(@subscriptions.job.organization,@subscriptions.job) , notice: "Subscription updated"
  end

  def destroy
    @subscriptions = Subscription.find(params[:id])
    @subscriptions.update(id: params[:id], user_id: params[:user_id], status: :cancel)
    redirect_to organization_job_subscriptions_url(@subscriptions.job.organization,@subscriptions.job) , notice: "Subscription updated"
  end

  #TODO Set params permit
  private
    def subscription_params
      params.require(:subscription).permit(:user_id)
    end
end
