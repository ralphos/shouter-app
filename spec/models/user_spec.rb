require 'spec_helper'

describe User do
  it "#can_follow? unless already following" do
    user = create(:user)
    followed_user = create(:user)
    user.follow(followed_user)
    user.can_follow?(followed_user).should be_false
  end

  it "#can_follow? unless same user" do
    user = create(:user)
    user.can_follow?(user).should be_false
  end

  it "#can_follow? other users" do
    user = create(:user)
    followed_user = create(:user)
    user.can_follow?(followed_user).should be_true
  end
end
