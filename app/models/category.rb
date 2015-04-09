class Category < ActiveRecord::Base
  has_many :words
  
  accepts_nested_attributes_for :words
end
