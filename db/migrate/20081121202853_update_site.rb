class UpdateSite < ActiveRecord::Migration
  def self.up
    add_column :sites, :title, :string, :default => "", :null => false
    add_column :sites, :subtitle, :string, :default => "", :null => false
    add_column :sites, :slogan, :string, :default => "", :null => false
    add_column :sites, :background_color, :string, :default => "", :null => false
    add_column :sites, :font_color, :string, :default => "", :null => false
    add_column :sites, :font_style, :string, :default => "", :null => false
    add_column :sites, :font_size, :string, :default => "", :null => false
    add_column :sites, :content_background_color, :string, :default => "", :null => false
    add_column :sites, :a_font_style, :string, :default => "", :null => false
    add_column :sites, :a_font_color, :string, :default => "", :null => false
    add_column :sites, :top_background_color, :string, :default => "", :null => false
    add_column :sites, :top_color, :string, :default => "", :null => false
  end

  def self.down
    remove_column :sites, :title
    remove_column :sites, :subtitle
    remove_column :sites, :slogan
    remove_column :sites, :background_color
    remove_column :sites, :font_color
    remove_column :sites, :font_style
    remove_column :sites, :font_size
    remove_column :sites, :content_background_color
    remove_column :sites, :a_font_style
    remove_column :sites, :a_font_color
    remove_column :sites, :top_background_color
    remove_column :sites, :top_color
  end
end