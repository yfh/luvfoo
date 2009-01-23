class FixFeedItems < ActiveRecord::Migration
  def self.up
    execute "UPDATE feed_items SET item_type = 'NewsItem' WHERE item_type = 'Blog';"
  end

  def self.down
  end
end

