class CheckoutPolicy < ApplicationPolicy
  def create?
    @user.admin? || @user.user?
  end
end
