class Lesson < ActiveRecord::Base
  has_many :results
  belongs_to :user, :category
  
  accepts_nested_attributes_for :results
end
