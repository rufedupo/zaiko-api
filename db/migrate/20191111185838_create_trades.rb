class CreateTrades < ActiveRecord::Migration[6.0]
  def change
    create_table :trades do |t|
      t.integer :kind, :default => 0
      t.decimal :discount, :precision => 10, :scale => 2, :default => 0
      t.decimal :total_value, :precision => 10, :scale => 2, :default => 0
      t.datetime :release_date, :default => DateTime.now

      t.timestamps
    end
  end
end
