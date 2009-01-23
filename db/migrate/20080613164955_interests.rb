class Interests < ActiveRecord::Migration
  def self.up
    create_table "interests", :force => true do |t|
      t.string  "name"
    end
  end

  def self.down
    drop_table "interests"
  end
end

