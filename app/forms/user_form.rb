# require "reform/form/dry"

class UserForm < Reform::Form
  # feature Reform::Form::Dry

  property :first_name

  validation do
    required(:first_name).filled
  end
end
