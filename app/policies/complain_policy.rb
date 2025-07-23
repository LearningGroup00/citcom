class ComplainPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def index?
    true
  end

  def show?
    true
  end

  def update?
    user.present? && (user.user_type == 'admin' || record.user_id == user.id)
  end

  def destroy?
    user.present? && (user.user_type == 'admin' || record.user_id == user.id)
  end

  class Scope < Scope
    def resolve
      if user.present? && user.user_type == 'admin'
        scope.all
      elsif user.present?
        scope.where(user_id: user.id)
      else
        scope.none
      end
    end
  end
end
