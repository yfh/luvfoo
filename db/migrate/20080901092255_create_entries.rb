class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.string "permalink", :limit => 2083
      t.string "title"
      t.text "body"
      t.datetime "published_at"
      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end

