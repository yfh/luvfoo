class UpdateUploadsToo < ActiveRecord::Migration
  
  def self.up
    add_column :uploads, :uploadable_id, :integer
    add_column :uploads, :uploadable_type, :string
    Upload.update_all('uploadable_id = user_id', "uploadable_type = 'User'")
    
    rename_column :shared_uploads, :uploadable_id, :shared_uploadable_id
    rename_column :shared_uploads, :uploadable_type, :shared_uploadable_type
  end

  def self.down
    remove_column :uploads, :uploadable_id
    remove_column :uploads, :uploadable_type
    
    rename_column :shared_uploads, :shared_uploadable_id, :uploadable_id
    rename_column :shared_uploads, :shared_uploadable_type, :uploadable_type
  end
  
end