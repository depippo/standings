class Challenger
  attr_accessor :id, :name, :record, :odds, :week, :adjusted_wins, :projected_wins

    @challengers = []

    @jarjar = Challenger.new
    @jarjar.name = "Jar Jar Tartare"
    @jarjar.record =  "89-39-4"
    @challengers << @jarjar

    @gypsy = Challenger.new
    @gypsy.name = "Gypsy Danger"
    @gypsy.record =  "59-65-8"
    @challengers << @gypsy

    @vino = Challenger.new
    @vino.name = "Vino"
    @vino.record =  "55-72-5"
    @challengers << @vino

    @backyard = Challenger.new
    @backyard.name = "Backyards Loseagains"
    @backyard.record =  "49-78-5"
    @challengers << @backyard

    @miggy = Challenger.new
    @miggy.name = "Miggy Stardust"
    @miggy.record =  "74-52-6"
    @challengers << @miggy

    @uncle = Challenger.new
    @uncle.name = "Uncle Charlie"
    @uncle.record =  "73-53-6"
    @challengers << @uncle

    @didi = Challenger.new
    @didi.name = "Sir Didi's Sleepers"
    @didi.record =  "51-76-5"
    @challengers << @didi

    @steve = Challenger.new
    @steve.name = "SOS"
    @steve.record =  "40-85-7"
    @challengers << @steve

    @theresa = Challenger.new
    @theresa.name = "Keep it n your pence"
    @theresa.record =  "79-50-3"
    @challengers << @theresa

    @process = Challenger.new
    @process.name = "Trust The Process"
    @process.record =  "70-53-9"
    @challengers << @process

    @kevin = Challenger.new
    @kevin.name = "Swipe Left"
    @kevin.record =  "61-66-5"
    @challengers << @kevin

    @dan = Challenger.new
    @dan.name = "Team Emoji"
    @dan.record =  "56-67-9"
    @challengers << @dan

  def adjusted_wins
    array = self.record.split("-").map(&:to_f)
    wins = array[0] + (array[2] / 2)
    wins
  end

  def self.simulate
    self.sim_week11
  end

  def self.sim_week11
    sim = self.simulate_match(@miggy, @steve)
    new1 = sim[0]
    new2 = sim[1]
    puts "matchup 1 results, miggy steve:"
    @miggy.projected_wins = new1
    @steve.projected_wins = new2
    puts @miggy.projected_wins
    puts @steve.projected_wins

    sim = self.simulate_match(@jarjar, @vino)
    new3 = sim[0]
    new4 = sim[1]
    puts "matchup 2 results, jarjar vino:"    
    @jarjar.projected_wins = new3
    @vino.projected_wins = new4
    puts @jarjar.projected_wins
    puts @vino.projected_wins

    sim = self.simulate_match(@backyard, @gypsy)
    new5 = sim[0]
    new6 = sim[1]
    puts "matchup 3 results, backyard gypsy:"
    @backyard.projected_wins = new5
    @gypsy.projected_wins = new6
    puts @backyard.projected_wins
    puts @gypsy.projected_wins

    sim = self.simulate_match(@process, @kevin)
    new7 = sim[0]
    new8 = sim[1]
    puts "matchup 4 results, process kevin:"
    @process.projected_wins = new7
    @kevin.projected_wins = new8
    puts @process.projected_wins
    puts @kevin.projected_wins

    sim = self.simulate_match(@didi, @uncle)
    new9 = sim[0]
    new10 = sim[1]
    puts "matchup 5 results, didi uncle:"
    @didi.projected_wins = new9
    @uncle.projected_wins = new10
    puts @didi.projected_wins
    puts @uncle.projected_wins

    sim = self.simulate_match(@dan, @theresa)
    new11 = sim[0]
    new12 = sim[1]
    puts "matchup 6 results, dan theresa:"
    @dan.projected_wins = new11
    @theresa.projected_wins = new12
    puts @dan.projected_wins
    puts @theresa.projected_wins

  end

  def self.simulate_match(team1, team2)
    total_1 = team1.adjusted_wins
    total_2 = team2.adjusted_wins

    team_record1 = total_1 / 10
    team_record2 = total_2 / 10

    adjusted1 = (team_record1 - 6)
    adjusted1 /= 10
    adjusted1 += 6

    adjusted2 = (team_record2 - 6)
    adjusted2 /= 10
    adjusted2 += 6

    gen1 = Rubystats::NormalDistribution.new(adjusted1, 1)
    team_score1 = gen1.rng               # a single random sample

    gen2 = Rubystats::NormalDistribution.new(adjusted2, 1)
    team_score2 = gen2.rng

    dif = team_score1 - team_score2
    if dif > 6
      dif = 6
    elsif dif < -6
      dif = -6
    end
  
    if dif >= 0
      dif = dif.round
      dif += 6
      total_1 += dif
      total_2 += (12 - dif)
    else
      dif = dif.round.abs
      dif += 6
      total_2 += dif
      total_1 += (12 - dif)
    end

    totals = []
    totals << total_1
    totals << total_2
    return totals
  end

  def self.sort_by_wins
    @challengers.sort! { |a, b| b.projected_wins <=> a.projected_wins}
  end

 end
