class CreateBagPropertyEnums < ActiveRecord::Migration
  def self.up
    create_table :bag_property_enums do |t|
      t.integer "bag_property_id"
      t.string "name"
      t.string "value"
      t.integer "sort"
    end
    add_index :bag_property_enums, :bag_property_id
  end

  def self.down
    drop_table :bag_property_enums
  end
end
