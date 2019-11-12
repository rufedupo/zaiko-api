class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :sale_price, :precision => 10, :scale => 2, :default => 0
      t.timestamps
    end
  end
end
