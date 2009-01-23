class UpdateUploadsWithType < ActiveRecord::Migration
  def self.up
    Upload.update_all("uploadable_id = user_id, uploadable_type = 'User'", "user_id IS NOT NULL AND uploadable_type IS NULL")
  end

  def self.down
  end
end
