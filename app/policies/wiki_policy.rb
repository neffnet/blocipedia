class WikiPolicy < ApplicationPolicy
  def show?
    if record.private? && !(record.user == current_user)
      false
    else
      true
    end
  end

  def create?
    user.present?
  end

  def update?
    user.present? unless ( record.private? && !record.contributor.include?(current_user))
  end

  def destroy?
    user.present? && ( record.owner == user || user.admin? )
  end
end
