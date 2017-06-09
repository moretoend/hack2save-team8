class User::SubscriptionsController < ApplicationController

  def index
    @user = User.find_by(id: current_user.id)
    @subscriptions = @user.subscriptions
  end

  def new
    @subscription = Subscription.new()
    @job = Job.find_by(id: params[:job_id])
  end

  def create
    @subscription = Subscription.new(subscription_params)
    @subscription.job = Job.find_by(id: params[:job_id])
    @subscription.user = current_user
    @subscription.status = :applied
    @subscription.save
    if @subscription.valid?
      flash[:success] = 'Job applied!'
      redirect_to :root
    else
      flash.now[:error] = 'Cannot create subscription'
      render :new
    end
  end

  def abandon
    @subscription = Subscription.find_by(id: params[:id])
    @subscription.update(status: :dropped)
    flash[:success] = 'Job abandoned'
    redirect_to user_subscriptions_path(current_user)
  end 
  private
    def subscription_params
      return {} unless params[:subscription].present?
      params.require(:subscription).permit(:notes)
    end
end
