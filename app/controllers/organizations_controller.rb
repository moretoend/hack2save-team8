class OrganizationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @organizations = Organization.all
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)

    if @organization.valid?
      @organization.save
      redirect_to @organization
    else
      flash.now[:error] = 'aaaaaa'
      render :new
    end
  end

  def show
    @organization = Organization.find_by(id: params[:id])
  end

  def edit
    @organization = Organization.find_by(id: params[:id])
  end

  def update
    @organization = Organization.find_by(id: params[:id])
    if @organization.update(organization_params)
      redirect_to @organization
    else
      flash.now[:error] = 'Não foi possível editar'
      render :edit
    end
  end

  private
    def organization_params
      params.require(:organization).permit(:name, :cnpj, :phone, :email)
    end
end
