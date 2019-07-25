class Ability
    include CanCan::Ability
  
    def initialize(user)
     
        user ||= User.new 
        if user.is_admin?
            can :manage, :all
        else
          can :read, :all
        end
   
  
      alias_action(:create, :read, :update, :delete, to: :crud)
  
      can :crud, Idea do |idea|
    idea.user == user
      end
  
      can :crud, Review do |review|
        review.user == user
      end
      can :like, Idea do |idea|
        user.present? && idea.user != user
      end
    end
  end
  