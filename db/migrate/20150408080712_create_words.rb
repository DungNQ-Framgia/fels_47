class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :text
      t.references :category

      t.timestamps null: false
    end
  end
end
