class UpdateNewsItem < ActiveRecord::Migration
  def self.up
    add_column :news_items, :icon, :string
  end

  def self.down
    remove_column :news_items, :icon
  end
end

