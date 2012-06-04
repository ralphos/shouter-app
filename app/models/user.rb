class User < ActiveRecord::Base
  include Clearance::User

  has_many :shouts
  attr_accessible :email, :password

end
