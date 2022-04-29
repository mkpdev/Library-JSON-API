class CheckoutPolicy < ApplicationPolicy
  def create?
    @user.admin? || @user.user?
  end

  def update?
    @user.admin? || @user.user?
  end

  def index?
    @user.admin?
  end
end
