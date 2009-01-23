class Addurlkey < ActiveRecord::Migration

  def self.up
    add_column :groups, :url_key, :string
    add_index :groups, :url_key
    Group.find(:all) do |g|
      g.url_key = g.path
      g.save
    end
    remove_column :groups, :path

    add_column :forums, :url_key, :string
    add_index :forums, :url_key

    add_column :news_items, :url_key, :string
    add_index :news_items, :url_key
  end

  def self.down
    remove_column :groups, :url_key
    remove_column :forums, :url_key
    remove_column :news_item, :url_key
    add_column :groups, :path, :string
  end
end

