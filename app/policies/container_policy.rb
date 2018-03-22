class ContainerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show
    scope.where(:id => record.id).exists?
  end

  def create?
    return true
  end

  def new?
    create?
  end

  def update?
    user_is_owner_or_admin?
  end

  def destroy?
    user_is_owner_or_admin?
  end

  private

  def user_is_owner_or_admin?
    record.user == user || user.admin
  end
end
