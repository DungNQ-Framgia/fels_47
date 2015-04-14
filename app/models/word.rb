class Word < ActiveRecord::Base
  has_many :answers
  belongs_to :category

  accepts_nested_attributes_for :answers
end
