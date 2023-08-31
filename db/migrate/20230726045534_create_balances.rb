class CreateBalances < ActiveRecord::Migration[7.0]
  def change
    drop_table :orders
    create_table :balances do |t|
      t.float :value
      t.integer :user_id
      t.timestamps
    end
  end
end
