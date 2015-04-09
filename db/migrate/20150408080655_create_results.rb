class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.references :user
      t.references :lesson
      t.string :content
      t.integer :mark

      t.timestamps null: false
    end
  end
  add_foreign_key :results, :users
  add_foreign_key :results, :lessons
end
