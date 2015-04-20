class ChangeTableLessonColumnTypeName < ActiveRecord::Migration
  def self.up
    rename_column :lessons, :type, :lesson_type
  end

  def self.down
    rename_column :lessons, :lesson_type, :type
  end
end
