class User < ApplicationRecord
  authenticates_with_sorcery!
  ROLE_KINDS = %w[
    student
    teacher
    custodian
    admin
  ].freeze

  serialize :roles, Array

  def add_role(role)
    # self.roles = roles.push(role).uniq
    # save
    # update(roles: roles.push(role).uniq)
    new_roles = roles.push(role).uniq
    filtered_roles = new_roles.select { |r| ROLE_KINDS.include?(r) }
    update(roles: filtered_roles)
  end

  def remove_role(role)
    filtered_roles = roles.reject { |r| r == role }
    update(roles: filtered_roles)
  end

  def student?
    roles.include?('student')
  end

  def teacher?
    roles.include?('teacher')
  end

  def custodian?
    roles.include?('custodian')
  end

  def admin?
    roles.include?('admin')
  end

  def multirole?
    roles.size > 1
  end

  def full_name
    "#{last_name} #{first_name} #{middle_name}"
  end
end
