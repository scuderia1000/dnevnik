class CreateStudyGroup
  include Dry::Transaction

  step :validate
  step :persist
  step :display

  def validate(input)
    study_group = StudyGroup.new
    form = StudyGroupForm.new(study_group)
    if form.validate(input[:params])
      Right(form)
    else
      Left(form.errors)
    end
  end

  def persist(form)
    form.save
    Right(form)
  rescue ActiveRecord::RecordNotUnique
    Left(errors: { record: :not_unique })
  end

  def display(form)
    Right(form.model)
  end

end