class AddDeadlineToGames < ActiveRecord::Migration
  def up
    add_column :games, :deadline, :datetime
  end
  def down
    remove_column :games, :deadline
  end
end
