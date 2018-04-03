class ActivityPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def new?
    create?
  end

  def create?
    user_is_admin?
  end

  def update?
    user_is_admin?
  end

  def destroy?
    user_is_admin?
  end

  def up?
    user_is_admin?
  end

  def down?
    user_is_admin?
  end

  private

  def user_is_admin?
    user && user.admin
  end
end
