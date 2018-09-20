module Admin
  class BaseController < ApplicationController
    layout 'admin'
    before_action -> { render_forbidden unless current_user.admin? }
    # before_action -> { raise 'You are not admin' unless current_user.admin?}

    private

    def render_forbidden
      head :forbidden
    end
  end
end
