class JobsFiltersController < ApplicationController
  def index
    @jobs = load_jobs.where("title LIKE :search OR kind LIKE :search", search: "%#{params[:search]}%")
  end


  private


  def load_jobs
    Job.all.where.not(id: current_user.jobs.ids)
  end
end
