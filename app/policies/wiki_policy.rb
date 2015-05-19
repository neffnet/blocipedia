class WikiPolicy < ApplicationPolicy
  def show?
    if record.private? && !(record.user == user) && !(record.contributors.includes(user))
      false
    else
      true
    end
  end

  def create?
    user.present?
  end

  def update?
    if record.private?
      record.user == user || record.contributors.include?(user)
    else
      user.present?
    end
  end

  def destroy?
    user.present? && ( record.owner == user || user.admin? )
  end
end
