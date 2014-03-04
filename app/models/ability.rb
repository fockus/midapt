class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here.
    user ||= User.new # guest user (not logged in)
    alias_action :create, :read, :update, :destroy, :to => :crud

    can :crud, :all

    #can :update, Mind do |mind|
    #  mind.try(:user) == user
    #end

    #can :manage, :all, if user.admin?

    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
