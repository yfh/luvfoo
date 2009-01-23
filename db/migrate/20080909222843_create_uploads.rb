class CreateUploads < ActiveRecord::Migration
    def self.up
        create_table :uploads do |t|
            t.integer :parent_id
            t.integer :user_id
            t.string :content_type
            t.string :name
            t.string :caption, :limit => 1000
            t.text :description
            t.string :filename
            t.string :thumbnail
            t.integer :size
            t.integer :width
            t.integer :height
            t.timestamps
        end
        add_index :uploads, :parent_id
        add_index :uploads, :user_id
        add_index :uploads, :content_type
    end

    def self.down
        drop_table :uploads
    end
end