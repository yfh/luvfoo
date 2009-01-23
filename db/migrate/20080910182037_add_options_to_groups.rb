class AddOptionsToGroups < ActiveRecord::Migration
  def self.up
    add_column :groups, :default_role, :string, :default => :member
    add_column :groups, :visibility, :integer, :default => 2
    add_column :groups, :requires_approval_to_join, :boolean, :default => false
  end

  def self.down
    remove_column :groups, :default_role
    remove_column :groups, :visibility
    remove_column :groups, :requires_approval_to_join
  end
end

