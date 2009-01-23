class AddFeedItemCreatorId < ActiveRecord::Migration
  def self.up
    add_column :feed_items, :creator_id, :integer
  end

  def self.down
    remove_column :feed_items, :creator_id
  end
end
