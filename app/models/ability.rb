class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, :to => :crud
    alias_action :edit, :update, :destroy, :to => :modify

    user ||= User.new # guest user (not logged in)

    can :read, :all

    can [:create, :user_index], Mind unless user.id == 0

    can :modify, Mind, :user_id => user.id
  end
end
