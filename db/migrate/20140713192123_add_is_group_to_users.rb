class AddIsGroupToUsers < ActiveRecord::Migration
  def up
    add_column :users, :is_group, :boolean, :default => false
  end
  def down
    remove_column :users, :is_group
  end
end
