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
    Round.where(pos: 19).update_all(amount: 40000)
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

  desc "Update games for round of 8"
  task :update_games_round_8, [:role] => :environment do
    # Quarter Finals
    # Game 57: Win 53 vs Win 54
    Game.create(round_id: 17, pos: 57, team1_id: 131, team2_id: 127, play_at: DateTime.parse("2014-07-04 6:00:00"), postponed: false, knockout: true, locked: false, calc: false, deadline: DateTime.parse("2014-07-04 9:00:00").in_time_zone('Hanoi'), time_zone: -3)
    # Game 58: Win 49 vs Win 50
    Game.create(round_id: 17, pos: 58, team1_id: 211, team2_id: 215, play_at: DateTime.parse("2014-07-04 10:00:00"), postponed: false, knockout: true, locked: false, calc: false, deadline: DateTime.parse("2014-07-04 9:00:00").in_time_zone('Hanoi'), time_zone: -3)
    # Game 59: Win 55 vs Win 56
    Game.create(round_id: 17, pos: 59, team1_id: 210, team2_id: 125, play_at: DateTime.parse("2014-07-05 6:00:00"), postponed: false, knockout: true, locked: false, calc: false, deadline: DateTime.parse("2014-07-05 9:00:00").in_time_zone('Hanoi'), time_zone: -3)
    # Game 60: Win 51 vs Win 52
    Game.create(round_id: 17, pos: 60, team1_id: 137, team2_id: 118, play_at: DateTime.parse("2014-07-05 10:00:00"), postponed: false, knockout: true, locked: false, calc: false, deadline: DateTime.parse("2014-07-05 9:00:00").in_time_zone('Hanoi'), time_zone: -3)
  end

  desc "Update games for semi final round"
  task :update_games_semi_final, [:role] => :environment do
    # Semi final
    # Game 61: Win 57 vs Win 58
    Game.create(round_id: 18, pos: 61, team1_id: 211, team2_id: 127, play_at: DateTime.parse("2014-07-08 10:00:00"), postponed: false, knockout: true, locked: false, calc: false, deadline: DateTime.parse("2014-07-08 9:00:00").in_time_zone('Hanoi'), time_zone: -3)
    # Game 62: Win 59 vs Win 60
    Game.create(round_id: 18, pos: 62, team1_id: 137, team2_id: 210, play_at: DateTime.parse("2014-07-09 10:00:00"), postponed: false, knockout: true, locked: false, calc: false, deadline: DateTime.parse("2014-07-09 9:00:00").in_time_zone('Hanoi'), time_zone: -3)
  end

  desc "Update games for final round"
  task :update_games_final, [:role] => :environment do
    # Semi final
    # Game 63: Lose 61 vs Lose 62
    Game.create(round_id: 19, pos: 63, team1_id: 211, team2_id: 137, play_at: DateTime.parse("2014-07-12 10:00:00"), postponed: false, knockout: true, locked: false, calc: false, deadline: DateTime.parse("2014-07-12 9:00:00").in_time_zone('Hanoi'), time_zone: -3)
    # Game 64: Win 61 vs Win 62
    Game.create(round_id: 20, pos: 64, team1_id: 127, team2_id: 210, play_at: DateTime.parse("2014-07-13 9:00:00"), postponed: false, knockout: true, locked: false, calc: false, deadline: DateTime.parse("2014-07-13 9:00:00").in_time_zone('Hanoi'), time_zone: -3)
  end

  desc "Update special users"
  task :update_special_user, [:role] => :environment do
    # Create group for specific user
    lienminh_win = User.find_by_username("lienminh_win")
    lienminh_thi_dai_hoc = User.find_by_username("lienminh_thi_dai_hoc")
    lienminh_minh_nhan = User.find_by_username("lienminh_minh_nhan")
    if lienminh_win
      User.where(username: ["huongdt", "hanght"]).each do |user|
        UserGroup.create(group_id: lienminh_win.id, user_id: user.id)
      end
    end
    if lienminh_thi_dai_hoc
      User.where(username: ["sinhnt", "hoahm", "locnpq"]).each do |user|
        UserGroup.create(group_id: lienminh_thi_dai_hoc.id, user_id: user.id)
      end
    end
    if lienminh_minh_nhan
      User.where(username: ["minhha", "nhannv"]).each do |user|
        UserGroup.create(group_id: lienminh_minh_nhan.id, user_id: user.id)
      end
    end
  end
end