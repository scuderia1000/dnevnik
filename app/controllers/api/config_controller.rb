module Api
  class ConfigController < BaseController
    def school
      json = {
          school: {
              title: Setting.school_title
          }
      }
      render json: json
    end
  end
end