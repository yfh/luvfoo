class AddCreatorToNewsItem < ActiveRecord::Migration
  def self.up
    add_column :news_items, :creator_id, :integer
    execute "UPDATE news_items SET creator_id = newsable_id WHERE newsable_type = 'User'"
  end

  def self.down
    remove_column :news_items, :creator_id
  end
end

