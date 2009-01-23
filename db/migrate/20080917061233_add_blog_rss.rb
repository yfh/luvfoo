class AddBlogRss < ActiveRecord::Migration
    def self.up
        add_column :users, :blog_rss, :string
    end

    def self.down
        remove_column :users, :blog_rss
    end
end
