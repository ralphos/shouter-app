class User < ActiveRecord::Base
  include Clearance::User

  attr_accessible :email, :password
  has_many :shouts
  has_many :following_relationships, foreign_key: :follower_id
  has_many :followed_users, through: :following_relationships

  def follow(user)
    self.following_relationships.create(followed_user: user)   
  end

  def can_follow?(user)
    self_and_followed_user_ids.exclude?(user.id) 
  end

  def shout_timeline
    ShoutTimeline.new(self_and_followed_user_ids)
  end

  def public_shout_timeline
    ShoutTimeline.new(id)
  end

  private

  def self_and_followed_user_ids
    # Added the user id to the array of followed_user_ids
    [id] + followed_user_ids
  end
end
