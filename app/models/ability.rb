class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.is? :admin
      can :manage, :all
    elsif user.is? :regular
      can :manage, Event, user_id: user.id
      can :manage, EventInstance, event: { user_id: user.id }
      can :manage, Attachment, event: { user_id: user.id }
      can :show, Attachment
    end
  end
end
