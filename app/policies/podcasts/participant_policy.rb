class Podcasts::ParticipantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
end
