class CreateLogos < ActiveRecord::Migration
  
  def self.up
    create_table :logos do |t|
      t.integer  "site_id"
      t.integer  "parent_id"
      t.integer  "user_id"
      t.integer  "size"
      t.integer  "width"
      t.integer  "height"
      t.string   "content_type"
      t.string   "filename"
      t.string   "thumbnail"
      t.timestamps
    end

    add_index "logos", ["site_id"], :name => "index_logos_on_site_id"
    add_index "logos", ["parent_id"], :name => "index_logos_on_parent_id"
    add_index "logos", ["user_id"], :name => "index_logos_on_user_id"
    add_index "logos", ["content_type"], :name => "index_logos_on_content_type"
    
  end

  def self.down
    drop_table :logos
  end
  
end
