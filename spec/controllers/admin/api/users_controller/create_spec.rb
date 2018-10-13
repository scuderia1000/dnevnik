require 'rails_helper'
require 'sorcery'
require_relative '../shared/not_authenticated'
require_relative '../shared/not_authorized_as_admin'

RSpec.describe Admin::Api::UsersController, type: :controller do
  include Sorcery::TestHelpers::Rails::Controller

  describe 'Create' do
    it_behaves_like 'not authenticated', action: :create, method: :post
    # it_behaves_like 'not authorized as admin', action: :create, method: :post

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

        context 'with bad params' do

          before(:each) do
            login_user(user)
            post :create, format: :json, params: { user: { first_name: 'Ron' } }
          end

          it 'returns 200 http code' do
            expect(response.code).to eq('200')
          end

          it 'returns errors description' do
            expect(JSON.parse(response.body)).to eq(
                 { "errors" => {
                     "iin"=>["must be filled", "size must be 12"], "last_name"=>["must be filled"]
                  }
                 }
             )
          end
        end

        context 'with duplicated iin' do
          let!(:another_user) { create(:user, iin: '123456789012') }

          before(:each) do
            login_user(user)

            post :create, format: :json, params: {
                user: {
                    first_name: 'Ron',
                    last_name: 'Wizzley',
                    iin: another_user.iin
                }
            }
          end

          it 'returns 200 http code' do
            expect(response.code).to eq('200')
          end

          it 'returns errors description' do
            expect(JSON.parse(response.body)).to eq({ "errors" => { "record" => "not_unique" } })
          end
        end

        context 'with valid data' do
          before(:each) do
            login_user(user)
            post :create, format: :json, params: {
                user: {
                    first_name: 'Ron',
                    last_name: 'Wizzley',
                    iin: '123456789012'
                }
            }
          end

          it 'returns 200 http code' do
            expect(response.code).to eq('200')
          end

          it 'returns new created user' do
            expect_json(
                'user',
                id: User.all.order(:created_at).last.id,
                first_name: 'Ron',
                last_name: 'Wizzley',
                middle_name: nil,
                iin: '123456789012'
            )
          end
        end

      end
    end

  end
end
