class AddTradeToOperations < ActiveRecord::Migration[6.0]
  def change
    add_reference :operations, :trade, null: false, foreign_key: true
  end
end
