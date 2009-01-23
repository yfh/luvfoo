class CreateSharedPages < ActiveRecord::Migration
  def self.up
    create_table :shared_pages do |t|
      t.integer  "content_page_id"
      t.string   "share_type", :default => "",    :null => false
      t.integer  "share_id",                      :null => false
      t.integer  "status", :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :shared_pages
  end
end

