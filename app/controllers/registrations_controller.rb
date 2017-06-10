class RegistrationsController < Devise::RegistrationsController

  def edit
    @user.build_address unless @user.address

    super
  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
