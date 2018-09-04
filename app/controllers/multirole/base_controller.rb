module Multirole
  class BaseController < ApplicationController
    layout 'multirole'
    before_action -> { raise 'You are not multirole' unless current_user.multirole? }
  end
end
