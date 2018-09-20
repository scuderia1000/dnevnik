require 'rails_helper'
# require 'sorcery'
# require_relative '../shared/not_authenticated'
# require_relative '../shared/not_authorized_as_admin'

RSpec.describe Admin::Api::UsersController, type: :controller do
  include Sorcery::TestHelpers::Rails::Controller

  describe 'GET Index' do
    context 'not authenticated' do
      it 'returns 401 http code' do
        get :index, format: :json
        expect(response.code).to eq('401')
      end
    end

    context 'authenticated' do
      context 'not admin' do
        let!(:user) { create(:user) }
        it 'returns 403 http code' do
          login_user(user)
          get :index, format: :json
          expect(response.code).to eq('403')
        end
      end

      context 'admin' do
        let!(:user) { create(:user, :admin) }
        let!(:users) { create_list(:user, 4) }

        it 'returns 200 http code' do
          login_user(user)
          get :index, format: :json
          expect(response.code).to eq('200')
        end

        it 'returns collection of users' do
          login_user(user)
          get :index, format: :json
          expect_json_sizes(users: 5)
        end
      end
    end
  end
  # include Sorcery::TestHelpers::Rails::Controller
  #
  # describe 'Index' do
  #   it_behaves_like 'not authenticated', action: :index, method: :get
  #   it_behaves_like 'not authorized as admin', action: :index, method: :get
  #
  #   context 'authorized as admin' do
  #     let!(:admin) { create(:user, :admin) }
  #     let!(:study_groups) { create_list(:study_group, 4) }
  #
  #     context 'plain request' do
  #       before(:each) do
  #         login_user(admin)
  #         get :index
  #       end
  #
  #       it 'returns 200 code' do
  #         expect(response.code).to eq('200')
  #       end
  #
  #
  #     end
  #   end
  #
  # end

end