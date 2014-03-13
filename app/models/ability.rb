class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    alias_action :create, :read, :update, :destroy, :to => :crud

    can :crud, :all if user.role == "admin"
    can :read, :all
    can :crud, Mind do |mind|
      mind.user.id == user.id
    end

    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
