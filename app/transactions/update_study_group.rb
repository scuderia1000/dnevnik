class UpdateStudyGroup
  include Dry::Transaction

  step :find
  step :validate
  step :persist
  step :display

  def find(input)
    study_group = StudyGroup.find_by_id(input[:id])
    if study_group
      Right(study_group: study_group, params: input[:params])
    else
      Left(errors: { record: :not_found })
    end
  end

  def validate(input)
    study_group = input[:study_group]
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