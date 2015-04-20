class CreateLearnedWords < ActiveRecord::Migration
  def change
    create_table :learned_words do |t|
      t.references :user
      t.references :word
      t.boolean :is_learned

      t.timestamps null: false
    end
  end
end
