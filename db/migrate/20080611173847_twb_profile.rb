class TwbProfile < ActiveRecord::Migration
  def self.up
    add_column :users, :organization, :string
    add_column :users, :grade_experience, :integer
    add_column :users, :first_language, :integer
    add_column :users, :why_joined, :text
    add_column :users, :skills, :text
    add_column :users, :occupation, :text

    create_table "languages", :force => true do |t|
      t.string  "name"
      t.string  "english_name"
      t.boolean "is_default", :default => false
    end
  end

  def self.down
    remove_column :users, :organization
    remove_column :users, :grade_experience
    remove_column :users, :first_lagnuage
    drop_table "languages"
  end
end

