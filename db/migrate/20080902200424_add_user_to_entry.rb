class AddUserToEntry < ActiveRecord::Migration
  def self.up
    add_column :entries, :user_id, :integer
    rename_column :shared_entries, :user_id, :shared_by_id
  end

  def self.down
    remove_column :entries, :user_id
    rename_column :shared_entries, :shared_by_id, :user_id
  end
end

