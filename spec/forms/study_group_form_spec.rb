require 'rails_helper'

RSpec.describe StudyGroupForm, type: :form do
  let(:form) { StudyGroupForm.new(StudyGroup.new) }
  it 'validates presence of title' do
    form.validate(title: '')
    expect(form.errors[:title]).to include('must be filled')
  end

  it 'validates presence of level' do
    form.validate(level: '')
    expect(form.errors[:level]).to include('must be filled')
  end

  it 'validates numericality of level' do
    form.validate(level: 'a')
    expect(form.errors[:level]).to include('must be an integer')
  end
end