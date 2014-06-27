class Ability
  include CanCan::Ability

  def initialize(user)
    can [:read, :day], Post

    if user.present?
      can :manage, Post, domain: user.domain
      can :manage, user

      can :manage, TimelineEntry, user_id: user.id
    end
  end
end
