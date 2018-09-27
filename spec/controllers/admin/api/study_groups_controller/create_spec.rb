require 'rails_helper'
require 'sorcery'
require_relative '../shared/not_authenticated'
require_relative '../shared/not_authorized_as_admin'

RSpec.describe Admin::Api::StudyGroupsController, type: :controller do
  include Sorcery::TestHelpers::Rails::Controller

  describe 'Create' do
    it_behaves_like 'not authenticated', action: :create, method: :post
    it_behaves_like 'not authorized as admin', action: :create, method: :post

    context 'authorized as admin' do
      let!(:admin) { create(:user, :admin) }
      let!(:study_group) { create(:study_group) }

      context 'with bad params' do
        before(:each) do
          login_user(admin)
          post :create, params: { study_group: { title: '1' } }
        end

        it 'returns 200 code' do
          expect(response.code).to eq('200')
        end

        it 'returns error description' do
          expect(response.body).to eq(
             JSON.generate({ errors: { level: ['must be filled'] } })
           )
        end
      end

      context 'with existing record with samw params' do
        before(:each) do
          login_user(admin)
          post :create, params: {
              study_group: { title: study_group.title, level: study_group.level }
          }
        end

        it 'returns 200 code' do
          expect(response.code).to eq('200')
        end

        it 'returns errors description' do
          expect(response.body).to eq(
               JSON.generate({ errors: { record: :not_unique } })
           )
        end
      end


    end
  end


end
