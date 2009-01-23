class UpdateUploads < ActiveRecord::Migration
  def self.up
    add_column :uploads, :is_public, :boolean, :default => 1
  end

  def self.down
    remove_column :uploads, :is_public
  end
end
