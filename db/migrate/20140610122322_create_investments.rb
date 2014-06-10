class CreateInvestments < ActiveRecord::Migration
  def change
    create_table(:investments) do |t|
      t.integer :game_id
      t.integer :total, :default => 0
      t.integer :remaining, :default => 0

      t.timestamps
    end
  end
end
