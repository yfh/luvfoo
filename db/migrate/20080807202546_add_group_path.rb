class AddGroupPath < ActiveRecord::Migration
  def self.up
    add_column :groups, :path, :string
  end

  def self.down
    remove_column :groups, :path
  end
end

