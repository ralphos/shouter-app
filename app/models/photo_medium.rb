class PhotoMedium < ActiveRecord::Base
  attr_accessible :photo
  has_attached_file :photo, styles: { medium: "300 x 300" }
  has_one :shout, as: :medium
end
