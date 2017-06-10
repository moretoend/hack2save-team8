class HomeController < ApplicationController
  def index
    @lastJobs =  Job.all.where.not(id: current_user.jobs.ids).paginate(:page => params[:page], :per_page => 5)
  end
end
