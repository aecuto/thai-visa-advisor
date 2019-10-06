# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      if user.is_admin?
        can :manage, :all
      elsif user.is_family?
        can :manage, Member
        cannot :new, Member
      end
    end
    
    can :register, Family
    can :register_confirm, Family
  end

end
