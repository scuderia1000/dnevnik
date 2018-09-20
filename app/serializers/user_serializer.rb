class UserSerializer < ActiveModel::Serializer
  attributes :id, :iin, :first_name, :last_name, :middle_name
end
