class UpdateContentPagesForTree < ActiveRecord::Migration
  def self.up
    add_column :content_pages, :parent_id, :integer, :null => false, :default => 0
    add_index :content_pages, :parent_id
  end

  def self.down
    remove_index :content_pages, :parent_id
    remove_column :content_pages, :parent_id
  end
end