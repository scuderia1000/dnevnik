module Teacher
  class BaseController < ApplicationController
    layout 'teacher'
    before_action -> { raise 'You are not teacher' unless current_user.teacher? }
  end
end
