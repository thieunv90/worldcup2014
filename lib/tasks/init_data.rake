namespace :db do
  desc "Update time zone for each match"
  task :update_time_zone, [:role] => :environment do
    Game.where(id: [8, 20, 44, 4, 34, 40, 17, 29]).update_all(time_zone: -4)
    another_games_ids = Game.all.map(&:id) - [8, 20, 44, 4, 34, 40, 17, 29]
    Game.where(id: another_games_ids).update_all(time_zone: -3)
  end
  desc "Add deadline time to each match"
  task :update_deadline, [:role] => :environment do
    Game.all.each do |game|
      local_time = game.play_at_local
      local_date = local_time.to_date
      if (1..12).to_a.include?(local_time.hour)
        deadline_day = local_date - 1.day
      else
        deadline_day = local_date
      end
      game.update_attributes(deadline: DateTime.parse("#{deadline_day.to_s} 9:00:00").in_time_zone('Hanoi'))
    end
  end

  desc "Update amount of money to bet for each round"
  task :update_amount_of_money, [:role] => :environment do
    Round.where(pos: (1..15).to_a).update_all(amount: 10000)
    Round.where(pos: 16).update_all(amount: 20000)
    Round.where(pos: 17).update_all(amount: 30000)
    Round.where(pos: 18).update_all(amount: 40000)
    Round.where(pos: 19).update_all(amount: 50000)
    Round.where(pos: 20).update_all(amount: 50000)
  end
end