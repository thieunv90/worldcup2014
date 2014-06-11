class AddTimezoneToGames < ActiveRecord::Migration
  def up
    add_column :games, :time_zone, :integer
  end
  def down
    remove_column :games, :time_zone
  end
end
