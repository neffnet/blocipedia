class WikiPolicy < ApplicationPolicy
  def show?
    if record.private?
      record.user == user || record.contributors.exists?(user)
    else
      true
    end
  end

  def create?
    user.present?
  end

  def update?
    if record.private?
      record.user == user || record.contributors.exists?(user)
    else
      user.present?
    end
  end

  def destroy?
    user.present? && ( record.owner == user || user.admin? )
  end
end
