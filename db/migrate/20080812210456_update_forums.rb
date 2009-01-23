class UpdateForums < ActiveRecord::Migration
  def self.up
    add_column :forums, :forumable_type, :string
    add_column :forums, :forumable_id, :integer
  end

  def self.down
    remove_column :forums, :forumable_type
    remove_column :forums, :forumable_id
  end
end

