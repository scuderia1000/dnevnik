class ApplicationController < ActionController::Base
  # protected_from_forgery with: exeption
  before_action :require_login

  private
  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end
end
