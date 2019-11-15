class Trade < ApplicationRecord
  belongs_to :user
  has_many :operations, dependent: :destroy
  
  #kind > stock_in = 0 | stock_out = 1 | sale = 2
  #status > initial = 0 | saved = 1 | done = 2 | reversed = 3

  validates_presence_of :kind

  validates_presence_of :total_value
  validates :total_value, :numericality => { :greater_than_or_equal_to => 0 }
  validates_presence_of :discount
  validates :discount, :numericality => { :greater_than_or_equal_to => 0 }
  validates_presence_of :release_date
end
