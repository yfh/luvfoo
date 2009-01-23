class UpdateFeeds < ActiveRecord::Migration
  def self.up
    add_column :feeds, :ownable_type, :string
    Feed.find(:all) do |f|
      f.ownable_type = 'User'
      f.save
    end
    rename_column :feeds, :user_id, :ownable_id
  end

  def self.down
    remove_column :feeds, :ownable_type
    rename_column :feeds, :ownable_id, :user_id
  end
end

