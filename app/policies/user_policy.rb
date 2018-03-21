class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    return true
  end

  def new?
    create?

  end

  def show?
    return true

  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
