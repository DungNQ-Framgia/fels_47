class ChangeTableLeanredWordColumnIsLearned < ActiveRecord::Migration
  def self.up
    rename_column :learned_words, :is_learned, :learned
  end

  def self.down
    rename_column :learned_words, :learned, :is_learned
  end
end
