class RenamedTypeFromTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :operation, :string
  end
end
