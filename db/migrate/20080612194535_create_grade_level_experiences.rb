class CreateGradeLevelExperiences < ActiveRecord::Migration
  def self.up
    create_table :grade_level_experiences do |t|
      t.string "name"
      t.timestamps
    end
  end

  def self.down
    drop_table :grade_level_experiences
  end
end

