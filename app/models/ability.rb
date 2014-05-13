class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    alias_action :create, :read, :update, :destroy, :to => :crud

    if user.role == 'admin'
      can :crud, :all 
    else
      can :read, :all
    end
    
    # Разрешаем все изменение в мысли автору
    can :crud, Mind do |mind|
      unless mind.user.nil?
        mind.user.id == user.id
      else
        true
      end
    end

    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
