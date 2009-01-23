class CreateSharedUploads < ActiveRecord::Migration
  def self.up
    create_table :shared_uploads do |t|
      t.integer "uploadable_id"
      t.string  "uploadable_type"
      t.integer "upload_id"
      t.integer "shared_by_id"
      t.timestamps
    end
    
    add_index "shared_uploads", "uploadable_id"
    add_index "shared_uploads", "upload_id"
    add_index "shared_uploads", "shared_by_id"
    
  end

  def self.down
    drop_table :shared_uploads
  end
end
