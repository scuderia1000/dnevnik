module Admin
  class BaseController < ApplicationController
    layout 'admin'
    before_action -> { raise 'You are not admin' unless current_user.admin?}
  end
end
