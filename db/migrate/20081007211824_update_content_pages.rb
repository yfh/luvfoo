class UpdateContentPages < ActiveRecord::Migration

  def self.up
    rename_column :content_pages, :name, :title
    remove_column :content_pages, :page_type
    rename_column :content_pages, :page_locale, :locale
    add_column :content_pages, :body_raw, :text, :default => ''
    add_column :content_pages, :contentable_id, :integer
    add_column :content_pages, :contentable_type, :string
  end

  def self.down
    rename_column :content_pages, :title, :name
    remove_column :content_pages, :body_raw
    remove_column :content_pages, :contentable_id
    remove_column :content_pages, :contentable_type
    add_column    :content_pages, :page_type, :string
    rename_column :content_pages, :locale, :page_locale
  end

end