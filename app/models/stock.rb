class Stock < ApplicationRecord
  belongs_to :product

  #status > inative = 0 | active = 1
end
