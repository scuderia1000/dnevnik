class CreateUser
  include Dry::Transaction

  step :validate
  # step :persist
  # step :display

  def validate(input)
    user = User.new
    form = UserForm.new(user)
    if form.validate(input[:params])
      Success(form)
    else
      Failure(form.errors)
    end
  end

  # def persist(form)
  #   form.save
  #   Right(form)
  # rescue ActiveRecord::RecordNotUnique
  #   Left(errors: { record: :not_unique })
  # end
  #
  # def display(form)
  #   Right(form.model)
  # end

end