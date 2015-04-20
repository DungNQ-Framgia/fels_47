class Lesson < ActiveRecord::Base
  has_many :results
  belongs_to :user
  belongs_to :category
  
  accepts_nested_attributes_for :results
  # constants
  LESSON_TYPE_NEW = 1
  LESSON_TYPE_REVIEW = 2
end
