class OrganizationsController < ApplicationController
  before_action :find_organization_from_user_by_id, only: [:update, :edit, :show]
  before_action :validate_user_profile!, only: [:new, :create]

  def index
    @organizations = current_user.organizations
  end

  def new
    @organization = current_user.organizations.build
    @organization.build_address
  end

  def create
    @organization = current_user.organizations.build(organization_params)

    if @organization.valid?
      @organization.save

      redirect_to @organization
    else
      flash.now[:error] = 'Could not create organization'

      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @organization.update(organization_params)
      redirect_to @organization
    else
      flash.now[:error] = 'Could not edit organization'
      render :edit
    end
  end

  private

  def organization_params
    params.require(:organization).permit(
      :name,
      :cnpj,
      :phone,
      :email,
      :service_kind,
      :about,
      address_attributes: [
        :country,
        :state,
        :city,
        :neighborhood,
        :street,
        :number,
        :complement,
        :zipcode
      ]
    )
  end

  def find_organization_from_user_by_id
    @organization = current_user.organizations.find_by(id: params[:id])
  end
end
