class CreateSharedEntries < ActiveRecord::Migration
  def self.up
    create_table :shared_entries do |t|
      t.integer  "user_id"
      t.integer  "entry_id"
      t.string   "destination_type", :default => "",    :null => false
      t.integer  "destination_id",                      :null => false
      t.datetime "created_at"
    end
  end

  def self.down
    drop_table :shared_entries
  end
end

