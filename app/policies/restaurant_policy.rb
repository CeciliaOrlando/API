class RestaurantPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope #es solo para el index
        def resolve
      scope.all
    end
  end


  def show?
    true
  end

  def create?
    user.present?
  end

  def destroy?
    record.user == user
  end


  def update?
    update?
  end
end
