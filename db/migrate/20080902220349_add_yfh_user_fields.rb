class AddYfhUserFields < ActiveRecord::Migration
  def self.up
    add_column :users, :gender, :boolean
    add_column :users, :birthdate, :string
    add_column :users, :organization_member, :boolean
    add_column :users, :organization_url, :string, :limit => 2083
    add_column :users, :organization_status, :integer
    add_column :users, :reason_joined, :integer
    add_column :users, :how_found, :integer
  end

  def self.down
    remove_column :users, :gender
    remove_column :users, :birthdate
    remove_column :users, :organization_member
    remove_column :users, :organization_url
    remove_column :users, :organization_status
    remove_column :users, :reason_joined
    remove_column :users, :how_found
  end
end
