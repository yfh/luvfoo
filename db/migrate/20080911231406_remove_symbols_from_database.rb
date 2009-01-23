class RemoveSymbolsFromDatabase < ActiveRecord::Migration
  def self.up
    execute "UPDATE memberships SET role = 'member' WHERE role LIKE '%member%';"
    execute "UPDATE memberships SET role = 'manager' WHERE role LIKE '%manager%';"
    execute "UPDATE groups SET default_role = 'member' WHERE default_role LIKE '%member%';"
    execute "UPDATE groups SET default_role = 'manager' WHERE default_role LIKE '%manager%';"
  end

  def self.down
  end
end

