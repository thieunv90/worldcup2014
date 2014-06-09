class CreateUserScores < ActiveRecord::Migration
  def up
    create_table :user_scores, :id => false do |t|
      t.integer :user_id
      t.integer :score_id
      t.integer :game_id
      t.date :bid_date

      t.timestamps
    end
    add_index :user_scores, [:user_id, :score_id, :game_id], unique: true
  end

  def down
    drop_table :user_scores
  end
end
