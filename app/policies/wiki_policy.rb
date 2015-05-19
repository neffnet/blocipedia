class WikiPolicy < ApplicationPolicy
  # def show?
  #   true unless ( record.private? && !record.contributors.include? current_user )
  # end

  def create?
    user.present?
  end

  def update?
    user.present? && ( record.user == user || user.admin?)
  end

  def destroy?
    user.present? && ( record.user == user || user.admin? )
  end
end
