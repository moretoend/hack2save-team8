class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  layout :define_layout


  private


  def define_layout
    return "application" if user_signed_in?
    return "login"
  end
end
