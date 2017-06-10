class HomeController < ApplicationController
  def index
    @lastJobs =  Job.paginate(:page => params[:page], :per_page => 5)
  end
end
