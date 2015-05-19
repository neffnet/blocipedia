class WikiPolicy < ApplicationPolicy
  def show?
    true unless ( record.private? && !record.users.include?(current_user) )
  end

  def create?
    user.present?
  end

  def update?
    user.present? unless ( record.private? && !record.users.include?(current_user))
  end

  def destroy?
    user.present? && ( record.owner == user || user.admin? )
  end
end
