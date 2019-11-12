class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.references :product, null: false, foreign_key: true
      t.decimal :quantity, :precision => 10, :scale => 3, :default => 0
      t.decimal :cost, :precision => 10, :scale => 2, :default => 0
      t.integer :status, :default => 1
      t.timestamps
    end
  end
end
