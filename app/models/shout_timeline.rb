class ShoutTimeline
  extend ActiveModel::Naming # This helps with the partial
  def initialize(user_id)
    @user_id = user_id
  end

  def shouts
    Shout.where(user_id: @user_id).current
  end
end
