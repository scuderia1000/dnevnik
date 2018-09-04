module Custodian
  class BaseController < ApplicationController
    layout 'custodian'
    before_action -> { raise 'You are not custodian' unless current_user.custodian? }
  end
end
