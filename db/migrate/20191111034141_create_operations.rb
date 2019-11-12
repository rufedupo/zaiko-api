class CreateOperations < ActiveRecord::Migration[6.0]
  def change
    create_table :operations do |t|
      t.integer :kind, :default => 0
      t.references :product, null: false, foreign_key: true
      t.decimal :quantity, :precision => 10, :scale => 3, :default => 0
      t.decimal :unit_price, :precision => 10, :scale => 2, :default => 0
      t.decimal :discount, :precision => 10, :scale => 2, :default => 0
      t.decimal :total_value, :precision => 10, :scale => 2, :default => 0
      t.datetime :release_date, :default => DateTime.now

      t.timestamps
    end
  end
end
