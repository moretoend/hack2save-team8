class JobsController < ApplicationController

  before_action :load_jobs, only: :index
  before_action :load_job, only: [:show, :edit, :update, :destroy]


  def index
  end

  def new
    build_job
  end

  def create
    build_job
    save_job || render(:new)
  end

  def show
  end

  def edit
  end

  def update
    build_job
    save_job || render(:edit)
  end

  def destroy
    destroy_job
  end


  private


  def save_job
    redirect_to organization_job_path(@job.organization, @job) if @job.save
  end


  def destroy_job
    @job.destroy
    redirect_to organization_jobs_path(@job.organization)
  end


  def build_job
    @job ||= job_scope.build
    @job.attributes = job_params
  end


  def job_params
    return {} unless params[:job].present?
    params.required(:job).permit(:title, :kind, :places, :description, :start_date, :end_date)
  end


  def load_jobs
    @jobs = job_scope
  end


  def load_job
    @job = job_scope.find(params[:id])
  end


  def job_scope
    Organization.find(params[:organization_id]).jobs
  end
end
