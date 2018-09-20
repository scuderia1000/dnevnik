RSpec.shared_examples 'not authorized as admin' do |action:, method:, params: {}|
  let!(:not_admin) { create(:user) }
  it 'returns 403 code' do
    login_user(not_admin)
    send(method, action, format: :json, params: params)
    expect(response.code).to eq('403')
  end
end
