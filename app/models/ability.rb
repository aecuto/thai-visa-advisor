# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      if user.is_admin?
        can :manage, :all
      elsif user.is_organization?
        can :manage, Organization
        can :read, Family
      elsif user.is_family?
        can :manage, Member
        cannot :new, Member
      end
    end

  end

end
