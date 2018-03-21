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
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
