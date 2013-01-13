class AddAttachmentPathToImages < ActiveRecord::Migration
  def self.up
    change_table :images do |t|
      add_attachment :images, :image_object
    end
  end

  def self.down
    remove_attachment :images, :image_object
  end
end
