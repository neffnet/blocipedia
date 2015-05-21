class UserPolicy < ApplicationPolicy
  def downgrade?
    user == record || user.admin?
  end
end