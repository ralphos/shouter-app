class CreatePhotoMedia < ActiveRecord::Migration
  def up
    create_table :photo_media do |t|
      t.has_attached_file :photo 
    end
  end

  def down
    drop_attached_file :photo_media, :photo
  end
end
