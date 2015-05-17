class UserPolicy < ApplicationPolicy
  def downgrade?
    user.premium? && user == record.user
  end

  def edit?
    user == record.user || user.admin?
  end

  def update?
    edit?
  end
end