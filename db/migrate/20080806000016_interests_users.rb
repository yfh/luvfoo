class InterestsUsers < ActiveRecord::Migration
  def self.up
    create_table :interests_users, :id => false, :force => true do |t|
      t.integer :user_id
      t.integer :interest_id
      t.timestamps
    end

    add_index :interests_users, [:user_id, :interest_id]
    add_index :interests_users, :user_id
  end

  def self.down
    drop_table :interests_users
  end
end

