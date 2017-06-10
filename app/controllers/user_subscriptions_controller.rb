class UserSubscriptionsController < ApplicationController

  def index
    @subscriptions = current_user.subscriptions
  end

  def new
    validate_user_profile!
    @subscription = current_user.subscriptions.build
    @job = Job.find_by(id: params[:job_id])
  end

  def create
    validate_user_profile!
    @subscription = current_user.subscriptions.build(subscription_params)
    @subscription.job = Job.find_by(id: params[:job_id])
    if @subscription.save
      flash[:success] = 'Job applied!'
      redirect_to user_subscriptions_path
    else
      flash.now[:error] = 'Cannot create subscription'
      render :new
    end
  end

  def abandon
    @subscription = Subscription.find_by(id: params[:id])
    @subscription.update(status: :canceled)
    flash[:success] = 'Subscription canceled'
    redirect_to user_subscriptions_path(current_user)
  end

  private

    def subscription_params
      return {} unless params[:subscription].present?
      params.require(:subscription).permit(:notes)
    end
end
