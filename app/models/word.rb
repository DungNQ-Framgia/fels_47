class Word < ActiveRecord::Base
  has_many :answers
  has_many :learned_words
  belongs_to :category

  accepts_nested_attributes_for :answers

  validate :check_is_correct

  private
  def check_is_correct
    if answers.select{|opt| opt.correct}.blank?
      errors.add(:base, 'Error not choice correct')
    end
  end

end
