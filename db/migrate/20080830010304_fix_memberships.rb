class FixMemberships < ActiveRecord::Migration

  def self.up
    drop_table :memberships
    create_table :memberships do |t|
      t.integer "group_id"
      t.integer "user_id"
      t.boolean "banned", :default => false
      t.string "role", :default => :member
      t.timestamps
    end
  end

  def self.down
    drop_table :memberships
    create_table :memberships do |t|
    end
  end
end

