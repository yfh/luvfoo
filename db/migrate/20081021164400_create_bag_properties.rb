class CreateBagProperties < ActiveRecord::Migration
  def self.up
    create_table :bag_properties do |t|
      t.integer "bag_id", :default => 1
      t.string "name"
      t.string "label"
      t.integer "data_type", :default => 1
      t.string "display_type", :default => 'text'
      t.boolean "required", :default => false
      t.string "default_value"
      t.integer "default_visibility", :default => 4
      t.boolean "can_change_visibility", :default => true
      t.integer "sort", :default => 9999
      t.integer "width", :default => -1
      t.integer "height", :default => -1
      t.integer "registration_page"
      t.string "sf_field"
      t.boolean "is_link", :default => false
      t.string "prefix"
      t.integer "maxlength", :default => 5000
    end
  end

  def self.down
    drop_table :bag_properties
  end
end
