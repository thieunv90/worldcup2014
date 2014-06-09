class AddScoreIdToGames < ActiveRecord::Migration
  def up
    add_column :games, :score_id, :integer
  end
  def down
    remove_column :games, :score_id
  end
end
