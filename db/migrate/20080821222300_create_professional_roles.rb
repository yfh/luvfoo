class CreateProfessionalRoles < ActiveRecord::Migration
  def self.up
    create_table :professional_roles do |t|
      t.string  "name"
      t.timestamps
    end
  end

  def self.down
    drop_table :professional_roles
  end
end

