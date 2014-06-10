class AddAmountToRounds < ActiveRecord::Migration
  def up
    add_column :rounds, :amount, :integer, :default => 0
  end
  def down
    remove_column :rounds, :amount
  end
end
