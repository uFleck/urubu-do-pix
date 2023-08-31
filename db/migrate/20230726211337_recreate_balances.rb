class RecreateBalances < ActiveRecord::Migration[7.0]
  def change
    drop_table :balances
  end
end
