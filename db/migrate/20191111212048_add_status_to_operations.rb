class AddStatusToOperations < ActiveRecord::Migration[6.0]
  def change
    add_column :operations, :status, :integer
  end
end
