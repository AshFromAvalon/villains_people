class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def missions?
    true
  end

  def validate?
    update?
  end

  def pay?
    update?
  end

  def done?
    update?
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
