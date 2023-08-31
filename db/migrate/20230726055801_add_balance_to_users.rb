class AddBalanceToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :balance, foreign_key: true
  end
end
