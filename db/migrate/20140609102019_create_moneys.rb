class CreateMoneys < ActiveRecord::Migration
  def change
    create_table(:moneys) do |t|
      t.integer :game_id
      t.integer :total
      t.integer :remaining

      t.timestamps
    end
  end
end
