class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :message_type
      t.integer :target_id

      t.timestamps null: false
    end
  end
end
