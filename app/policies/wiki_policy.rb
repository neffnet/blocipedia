class WikiPolicy < ApplicationPolicy

  def create?
    user.present?
  end

  def update?
    user.present?
  end

  def destroy?
    user.present? && ( record.user == current_user || current_user.admin? )
  end
end
