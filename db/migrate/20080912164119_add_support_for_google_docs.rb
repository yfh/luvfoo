class AddSupportForGoogleDocs < ActiveRecord::Migration
  def self.up
    add_column :entries, :google_doc, :boolean, :default => false
    add_column :entries, :displayable, :boolean, :default => false
    add_column :shared_entries, :can_edit, :boolean, :default => false
    add_column :shared_entries, :public, :boolean, :default => false
  end

  def self.down
    remove_column :entries, :google_doc
    remove_column :entries, :displayable
    remove_column :shared_entries, :can_edit
    remove_column :shared_entries, :public
  end
end
