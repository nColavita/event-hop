class AddAttachmentAvatarToPlaces < ActiveRecord::Migration
  def self.up
  	change_table :places do |t|
  		t.attachment :avatar
  	end
  end

  def self.down
  	remove_attachment :places, :avatar
  end
end
