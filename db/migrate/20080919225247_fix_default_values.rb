class FixDefaultValues < ActiveRecord::Migration
  def self.up
    execute "UPDATE groups SET default_role = 'observer' WHERE default_role LIKE '%observer%';"
    execute "ALTER TABLE groups ALTER default_role SET DEFAULT 'member'"
  end

  def self.down
  end
end
