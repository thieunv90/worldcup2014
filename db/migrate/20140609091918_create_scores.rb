class CreateScores < ActiveRecord::Migration
  def change
    create_table(:scores) do |t|
      t.string :name
    end
  end
end
