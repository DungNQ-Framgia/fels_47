class Category < ActiveRecord::Base
  has_many :words
  
  accepts_nested_attributes_for :words

  def generate_lesson(user, type)
    if type === Lesson::LESSON_TYPE_NEW.to_s
      self.words.where.not(id: user.learned_words.where(learned: true).pluck(:id)).limit(Constant.words_per_lesson).order("RANDOM()")
    elsif type === Lesson::LESSON_TYPE_REVIEW.to_s
      self.words.where(id: user.learned_words.where(learned: true).pluck(:id)).limit(Constant.words_per_lesson).order("RANDOM()")
    else
      self.words.limit(Constant.words_per_lesson).order("RANDOM()")
    end
  end

  def count_learned_word user
    self.words.where(id: user.learned_words.where(learned: true).pluck(:id)).count
  end
end
