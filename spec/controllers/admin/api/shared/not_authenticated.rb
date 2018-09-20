RSpec.shared_examples 'not authenticated' do |action:, method:, params: {}|
  it 'returns 401 code' do
    send(method, action, format: :json, params: params)
    expect(response.code).to eq('401')
  end
end