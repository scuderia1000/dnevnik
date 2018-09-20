# require 'reform/form/dry'

class UserForm < Reform::Form
  # feature Reform::Form::Dry # override the default.

  property :first_name
  property :last_name
  property :iin

  validation do
    required(:first_name).filled
    required(:last_name).filled
    required(:iin) { filled? & size?(12) }
  end
end
