class Product < ApplicationRecord
  before_create :create_stock
  has_many :operations, dependent: :destroy
  has_one :stock, dependent: :destroy 
  
  validates_presence_of :name
  validates_uniqueness_of :name, case_sensitive: true
  validates :sale_price, :numericality => { :greater_than_or_equal_to => 0 }
  
  private
  def create_stock
    self.stock = Stock.new
  end
end
