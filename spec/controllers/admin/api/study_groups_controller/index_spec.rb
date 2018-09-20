require 'rails_helper'
require 'sorcery'
# require_relative '../shared/not_authenticated'
# require_relative '../shared/not_authorized_as_admin'

RSpec.describe Admin::Api::StudyGroupsController, type: :controller do
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
  #       it 'returns list of study groups' do
  #         expect_json_sizes(study_groups: 4)
  #         expect_json_types(
  #             'study_groups.*',
  #             id: :integer,
  #             title: :string,
  #             level: :string
  #         )
  #       end
  #     end
  #
  #     context 'with query' do
  #       before(:each) do
  #         login_user(admin)
  #         get :index, params: { q: { id_eq: study_groups[0].id } }
  #       end
  #
  #       it 'returns 200 code' do
  #         expect(response.code).to eq('200')
  #       end
  #
  #       it 'returns filtered list of study groups' do
  #         expect_json_sizes(study_groups: 1)
  #         expect_json_types(
  #             'study_groups.*',
  #             id: :integer,
  #             title: :string,
  #             level: :string
  #         )
  #       end
  #     end
  #
  #   end
  #
  # end

end