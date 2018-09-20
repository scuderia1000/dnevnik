module Admin
  module Api
    class UsersController < BaseController
      def index
        users = User.all
        render json: users, status: 200
        # q = StudyGroup.ransack(params[:q])
        # study_groups = q.result.order_by_model
        # render json: study_groups
      end

      # def show
      #   study_group = StudyGroup.find(params[:id])
      #   render json: study_group
      # rescue ActiveRecord::RecordNotFound
      #   render json: { errors: { record: :not_found } }
      # end
      #
      # def create
      #   transaction = CreateStudyGroup.new
      #   result = transaction.call(params: params[:study_group])
      #   render json: result.value
      # end
      #
      # def update
      #   transaction = UpdateStudyGroup.new
      #   result = transaction.call(
      #       id: params[:id],
      #       params: params[:study_group]
      #   )
      #   render json: result.value
      # end
      #
      # def destroy
      #   transaction = DestroyStudyGroup.new
      #   result = transaction.call(id: params[:id])
      #   render json: result.value, status: result.success? ? 200 : 422
      # end
    end
  end
end