class CreateBudgets < ActiveRecord::Migration
  def change
    create_table(:budgets) do |t|
      t.integer :game_id
      t.integer :user_id
      t.integer :total_money_bet, :default => 0
      t.integer :total_money_win, :default => 0

      t.timestamps
    end
  end
end