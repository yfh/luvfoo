class AddProfileCacheFieldsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :protected_profile, :text
    add_column :users, :public_profile, :text
  end

  def self.down
    remove_column :users, :protected_profile
    remove_column :users, :public_profile
  end
end
