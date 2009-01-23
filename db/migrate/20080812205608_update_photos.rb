class UpdatePhotos < ActiveRecord::Migration
  def self.up
    add_column :photos, :photoable_type, :string
    rename_column :photos, :user_id, :photoable_id
  end

  def self.down
    remove_column :photos, :photoable_type
    rename_column :photos, :photoable_id, :user_id
  end
end

