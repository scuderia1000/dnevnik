require 'rails_helper'

RSpec.describe UserForm, type: :form do
  let(:form) { UserForm.new(User.new)}

  it 'validates presence of first_name' do
    form.validate(first_name: '')
    expect(form.errors[:first_name]).to include('must be filled')
  end
end
