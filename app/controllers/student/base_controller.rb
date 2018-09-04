module Student
  class BaseController < ApplicationController
    layout 'student'
    before_action -> { raise 'You are not student' unless current_user.student? }
  end
end
