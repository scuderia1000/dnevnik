require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#full_name' do
    it 'returns full name of user' do
      user = User.new(
          first_name: 'Ivan',
          last_name: 'Ivanov',
          middle_name: 'Ivanovich'
      )
      expect(user.full_name).to eq('Ivanov Ivan Ivanovich')

    end
  end
end
