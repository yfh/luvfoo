class CreateContentPages < ActiveRecord::Migration
  
  def self.up
    create_table :content_pages do |t|
      t.integer  "creator_id"
      t.string "name"
      t.string "url_key"
      t.text "body"
      t.string "page_type"
      t.string "page_locale"
      t.timestamps
    end
  end

  def self.down
    drop_table :content_pages
  end
  
end