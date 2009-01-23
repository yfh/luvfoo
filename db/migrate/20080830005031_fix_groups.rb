class FixGroups < ActiveRecord::Migration
  def self.up
    drop_table :groups

    create_table :groups do |t|
      t.integer   :creator_id
      t.string    :name
      t.text      :description
      t.string    :icon
      t.string    :state
      t.string    :url_key
      t.timestamps
    end

    add_index :groups, :url_key
    add_index :groups, :creator_id
  end

  def self.down
    drop_table :groups
    create_table :groups do |t|
    end
  end
end

