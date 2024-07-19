class FollowRequestPolicy < ApplicationPolicy
  attr_reader :user, :follow_request

  def initialize(user, follow_request)
    @user = user
    @follow_request = follow_request
  end

  def create?
    true
  end

  def update?
    if user == follow_request.recipient || user == follow_request.sender
      true
    end
  end

  def destroy?
    update?
  end
end
