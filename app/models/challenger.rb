class Challenger
  attr_accessor :id, :name, :record, :odds, :week, :adjusted_wins

  @jarjar = Challenger.new
  @jarjar.name = "Jar Jar Tartare"
  @jarjar.record =  "89-39-4"

  @gypsy = Challenger.new
  @gypsy.name = "Gypsy Danger"
  @gypsy.record =  "59-65-8"

  @vino = Challenger.new
  @vino.name = "Vino"
  @vino.record =  "55-72-5"

  @backyard = Challenger.new
  @backyard.name = "Backyards Loseagains"
  @backyard.record =  "49-78-5"

  @miggy = Challenger.new
  @miggy.name = "Miggy Stardust"
  @miggy.record =  "74-52-6"

  @uncle = Challenger.new
  @uncle.name = "Uncle Charlie"
  @uncle.record =  "73-53-6"

  @didi = Challenger.new
  @didi.name = "Sir Didi's Sleepers"
  @didi.record =  "51-76-5"

  @steve = Challenger.new
  @steve.name = "SOS"
  @steve.record =  "40-85-7"

  @theresa = Challenger.new
  @theresa.name = "Keep it n your pence"
  @theresa.record =  "79-50-3"

  @process = Challenger.new
  @process.name = "Trust The Process"
  @process.record =  "70-53-9"

  @kevin = Challenger.new
  @kevin.name = "Swipe Left"
  @kevin.record =  "61-66-5"

  @dan = Challenger.new
  @dan.name = "Team Emoji"
  @dan.record =  "56-67-9"


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
      puts new1
      puts new2

      sim = self.simulate_match(@jarjar, @vino)
      new3 = sim[0]
      new4 = sim[1]
      puts "matchup 2 results, jarjar vino:"    
      puts new3
      puts new4

      sim = self.simulate_match(@backyard, @gypsy)
      new5 = sim[0]
      new6 = sim[1]
      puts "matchup 3 results, backyard gypsy:"
      puts new5
      puts new6

      sim = self.simulate_match(@process, @kevin)
      new7 = sim[0]
      new8 = sim[1]
      puts "matchup 4 results, process kevin:"
      puts new7
      puts new8

      sim = self.simulate_match(@didi, @uncle)
      new9 = sim[0]
      new10 = sim[1]
      puts "matchup 5 results, didi uncle:"
      puts new9
      puts new10

      sim = self.simulate_match(@dan, @theresa)
      new11 = sim[0]
      new12 = sim[1]
      puts "matchup 6 results, dan theresa:"
      puts new11
      puts new12

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

    # total_difference = 0

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



 end
