class CreateTransactionsAndBalances < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :type
      t.float :value
      t.references :balance, foreign_key: true

      t.timestamps
    end

    create_table :balances do |t|
      t.float :value
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
