class ShowPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show_up?
    user_is_admin?
  end

  def show_down?
    user_is_admin?
  end

  def user_is_admin?
    user && user.admin
  end

end
