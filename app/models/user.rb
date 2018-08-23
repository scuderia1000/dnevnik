class User < ApplicationRecord
  def full_name
    "#{last_name} #{first_name} #{middle_name}"
  end
end
