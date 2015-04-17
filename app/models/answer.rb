class Answer < ActiveRecord::Base
  belongs_to :word

  validates :correct, inclusion: {in: [true, false]}

  scope :correct, ->{where correct: true}
end
