class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      can :update, User, :id => user.id
      can :read, :all
    end

    can [:create,:update], [Lesson, Document] if user.teacher?
    can [:create,:update], [Lesson] if user.trainee?

  end
end
