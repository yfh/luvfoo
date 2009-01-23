class AddContentPageVersions < ActiveRecord::Migration
  require_dependency 'content_page'
  def self.up
    # create_versioned_table takes the same options hash
    # that create_table does
    ContentPage.create_versioned_table
  end

  def self.down
    ContentPage.drop_versioned_table
  end
end