class ApplicationController < ActionController::Base
  protected_from_forgery unless -> { request.format.json? }
  before_action :require_login

  private

  def not_authenticated
    respond_to do |format|
      format.html { redirect_to login_path, alert: "Please login first" }
      format.json { render json: { error: 'Not authenticated' }, status: 401 }
    end
  end
end
