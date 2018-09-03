require 'rails_helper'

RSpec.describe User, type: :model do

  describe '#add_role' do
    it 'adds a new role' do
      user = FactoryBot.create(:user)
      # user = User.create
      user.add_role('student')
      expect(user.roles.size).to eq(1)
    end
    it 'does not add already existing role' do
      user = FactoryBot.create(:user)
      user.add_role('student')
      user.add_role('student')
      expect(user.roles.size).to eq(1)
    end
    it 'does not add not valid role' do
      user = FactoryBot.create(:user)
      user.add_role('choosen')
      expect(user.roles.size).to eq(0)
    end
  end

  describe '#remove_role' do
    context 'role exists for user' do
      it 'remove existing role' do
        user = FactoryBot.create(:user)
        user.add_role('student')
        user.remove_role('student')
        expect(user.roles.size).to eq(0)
      end
    end
    context 'role does not exists for user' do
      it 'does nothing' do
        user = FactoryBot.create(:user)
        user.remove_role('student')
        expect(user.roles.size).to eq(0)
      end
    end
  end

  describe '#student?' do
    context 'when has student role' do
      user = FactoryBot.create(:user)
      user.add_role('student')
      it 'returns true' do
        expect(user.student?).to eq(true)
      end
    end
    context 'when has no student role' do
      user = FactoryBot.create(:user)
      it 'return false' do
        expect(user.student?).to eq(false)
      end
    end
  end

  describe '#teacher?' do
    context 'when has teacher role' do
      user = FactoryBot.create(:user)
      user.add_role('teacher')
      it 'returns true' do
        expect(user.teacher?).to eq(true)
      end
    end
    context 'when has no teacher role' do
      user = FactoryBot.create(:user)
      it 'return false' do
        expect(user.teacher?).to eq(false)
      end
    end
  end

  describe '#custodian?' do
    context 'when has custodian role' do
      user = FactoryBot.create(:user)
      user.add_role('custodian')
      it 'returns true' do
        expect(user.custodian?).to eq(true)
      end
    end
    context 'when has no custodian role' do
      user = FactoryBot.create(:user)
      it 'return false' do
        expect(user.custodian?).to eq(false)
      end
    end
  end

  describe '#administrator?' do
    context 'when has administrator role' do
      user = FactoryBot.create(:user)
      user.add_role('administrator')
      it 'returns true' do
        expect(user.administrator?).to eq(true)
      end
    end
    context 'when has no administrator role' do
      user = FactoryBot.create(:user)
      it 'return false' do
        expect(user.administrator?).to eq(false)
      end
    end
  end



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
