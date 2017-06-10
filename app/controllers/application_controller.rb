require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html, :json

  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  layout :define_layout

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update) do |update_params|
      update_params.permit(user_data_params)
    end
  end

  def user_data_params
    [
      :email,
      :password,
      :current_password,
      :document_number,
      :fullname,
      :gender,
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
    ]
  end

  def validate_user_profile!
    unless current_user.valid_profile?
      flash[:warning] = "You must complete your profile first"
      redirect_back(fallback_location: root_path)
      return
    end
  end


  def define_layout
    layout = 'application' if user_signed_in?

    layout ||= 'login'
  end
end
