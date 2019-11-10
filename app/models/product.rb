class Product < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name
  validates :sale_price, :numericality => { :greater_than_or_equal_to => 0 }
end
