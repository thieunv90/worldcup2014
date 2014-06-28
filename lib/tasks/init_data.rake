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

  desc "Update name of scores"
  task :update_scores_name, [:role] => :environment do
    Score.all.each do |s|
      s.name = s.name.gsub(/[\s+)(]/,"")
      s.save
    end
  end

  desc "Update investment for each game"
  task :update_investment, [:role] => :environment do
    # Create total_money for all matches
    Game.order(:id).map(&:id).each do |game_id|
      Investment.find_or_create_by_game_id(game_id)
    end
  end

  desc "Update games for round of 16"
  task :update_games_round_16, [:role] => :environment do
    # Round 1/16
    # Game 49: 1A vs 2B
    Game.create(round_id: 16, pos: 49, team1_id: 211, team2_id: 212, play_at: DateTime.parse("2014-06-28 6:00:00"), postponed: false, knockout: true, locked: false, calc: false, deadline: DateTime.parse("2014-06-28 9:00:00").in_time_zone('Hanoi'), time_zone: -3)
    # Game 50: 1C vs 2D
    Game.create(round_id: 16, pos: 50, team1_id: 215, team2_id: 214, play_at: DateTime.parse("2014-06-28 10:00:00"), postponed: false, knockout: true, locked: false, calc: false, deadline: DateTime.parse("2014-06-28 9:00:00").in_time_zone('Hanoi'), time_zone: -3)
    # Game 51: 1B vs 2A
    Game.create(round_id: 16, pos: 51, team1_id: 137, team2_id: 190, play_at: DateTime.parse("2014-06-29 6:00:00"), postponed: false, knockout: true, locked: false, calc: false, deadline: DateTime.parse("2014-06-29 9:00:00").in_time_zone('Hanoi'), time_zone: -3)
    # Game 52: 1D vs 2C
    Game.create(round_id: 16, pos: 52, team1_id: 118, team2_id: 132, play_at: DateTime.parse("2014-06-29 10:00:00"), postponed: false, knockout: true, locked: false, calc: false, deadline: DateTime.parse("2014-06-29 9:00:00").in_time_zone('Hanoi'), time_zone: -3)
    # Game 53: 1E vs 2F
    Game.create(round_id: 16, pos: 53, team1_id: 131, team2_id: 20, play_at: DateTime.parse("2014-06-30 6:00:00"), postponed: false, knockout: true, locked: false, calc: false, deadline: DateTime.parse("2014-06-30 9:00:00").in_time_zone('Hanoi'), time_zone: -3)
    # Game 54: 1G vs 2H
    Game.create(round_id: 16, pos: 54, team1_id: 127, team2_id: 1, play_at: DateTime.parse("2014-06-30 10:00:00"), postponed: false, knockout: true, locked: false, calc: false, deadline: DateTime.parse("2014-06-30 9:00:00").in_time_zone('Hanoi'), time_zone: -3)
    # Game 55: 1F vs 2E
    Game.create(round_id: 16, pos: 55, team1_id: 210, team2_id: 153, play_at: DateTime.parse("2014-07-01 6:00:00"), postponed: false, knockout: true, locked: false, calc: false, deadline: DateTime.parse("2014-07-01 9:00:00").in_time_zone('Hanoi'), time_zone: -3)
    # Game 56: 1H vs 2G
    Game.create(round_id: 16, pos: 56, team1_id: 125, team2_id: 191, play_at: DateTime.parse("2014-07-01 10:00:00"), postponed: false, knockout: true, locked: false, calc: false, deadline: DateTime.parse("2014-07-01 9:00:00").in_time_zone('Hanoi'), time_zone: -3)
  end
end