require 'rails_helper'

RSpec.describe UserForm, type: :form do
  let(:form) { UserForm.new(User.new) }

  it 'validates presence of first_name' do
    form.validate(first_name: '')
    expect(form.errors[:first_name]).to include('must be filled')
  end

  it 'validates presence of last_name' do
    form.validate(last_name: '')
    expect(form.errors[:last_name]).to include('must be filled')
  end

  it 'validates presence of iin' do
    form.validate(iin: '')
    expect(form.errors[:iin]).to include('must be filled')
  end

  it 'validates length of iin to be 12' do
    form.validate(iin: '123')
    expect(form.errors[:iin]).to include('length must be 12')
  end
end
