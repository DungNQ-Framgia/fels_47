class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.references :user
      t.references :category
      t.integer :type

      t.timestamps null: false
    end
  end
end
