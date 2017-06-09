class JobsFiltersController < ApplicationController
  def index
    search = params['search'].present? ? params['search']['text'] : ""
    @jobs = load_jobs.where("title LIKE :search OR kind LIKE :search", search: "%#{search}%")
  end


  private


  def load_jobs
    Job.all.where.not(id: current_user.jobs.ids)
  end
end
