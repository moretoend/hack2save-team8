class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  layout :define_layout

  before_action :configure_permitted_parameters, if: :devise_controller?


  protected


  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:account_update) do |u|
        u.permit(:email, :password, :current_password, :document_number, :fullname, :gender)
      end
  end


  private


  def define_layout
    return "application" if user_signed_in?
    return "login"
  end
end
