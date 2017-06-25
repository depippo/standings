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
    self.sim_week12
    self.sim_week13
    self.sim_week14
    self.sim_week15
    self.sim_week16
    self.sim_week17
    self.sim_week18
    self.sim_week19
    self.sim_week20
    self.sim_week21
    self.sim_week22
  end

  def self.sim_week12
    sim = self.simulate_match(@miggy, @steve)
    new1 = sim[0]
    new2 = sim[1]
    @miggy.projected_wins = new1
    @steve.projected_wins = new2

    sim = self.simulate_match(@jarjar, @vino)
    new3 = sim[0]
    new4 = sim[1]  
    @jarjar.projected_wins = new3
    @vino.projected_wins = new4

    sim = self.simulate_match(@backyard, @gypsy)
    new5 = sim[0]
    new6 = sim[1]
    @backyard.projected_wins = new5
    @gypsy.projected_wins = new6

    sim = self.simulate_match(@process, @kevin)
    new7 = sim[0]
    new8 = sim[1]
    @process.projected_wins = new7
    @kevin.projected_wins = new8

    sim = self.simulate_match(@didi, @uncle)
    new9 = sim[0]
    new10 = sim[1]
    @didi.projected_wins = new9
    @uncle.projected_wins = new10

    sim = self.simulate_match(@dan, @theresa)
    new11 = sim[0]
    new12 = sim[1]
    @dan.projected_wins = new11
    @theresa.projected_wins = new12

  end

  def self.sim_week13
    sim = self.simulate_from_projected(@miggy, @didi)
    new1 = sim[0]
    new2 = sim[1]
    @miggy.projected_wins = new1
    @didi.projected_wins = new2

    sim = self.simulate_from_projected(@jarjar, @gypsy)
    new3 = sim[0]
    new4 = sim[1]  
    @jarjar.projected_wins = new3
    @gypsy.projected_wins = new4

    sim = self.simulate_from_projected(@backyard, @vino)
    new5 = sim[0]
    new6 = sim[1]
    @backyard.projected_wins = new5
    @vino.projected_wins = new6

    sim = self.simulate_from_projected(@process, @theresa)
    new7 = sim[0]
    new8 = sim[1]
    @process.projected_wins = new7
    @theresa.projected_wins = new8

    sim = self.simulate_from_projected(@steve, @uncle)
    new9 = sim[0]
    new10 = sim[1]
    @steve.projected_wins = new9
    @uncle.projected_wins = new10

    sim = self.simulate_from_projected(@dan, @kevin)
    new11 = sim[0]
    new12 = sim[1]
    @dan.projected_wins = new11
    @kevin.projected_wins = new12

  end

  def self.sim_week14
    sim = self.simulate_from_projected(@miggy, @uncle)
    new1 = sim[0]
    new2 = sim[1]
    @miggy.projected_wins = new1
    @uncle.projected_wins = new2

    sim = self.simulate_from_projected(@jarjar, @backyard)
    new3 = sim[0]
    new4 = sim[1]  
    @jarjar.projected_wins = new3
    @backyard.projected_wins = new4

    sim = self.simulate_from_projected(@gypsy, @vino)
    new5 = sim[0]
    new6 = sim[1]
    @gypsy.projected_wins = new5
    @vino.projected_wins = new6

    sim = self.simulate_from_projected(@process, @dan)
    new7 = sim[0]
    new8 = sim[1]
    @process.projected_wins = new7
    @dan.projected_wins = new8

    sim = self.simulate_from_projected(@steve, @didi)
    new9 = sim[0]
    new10 = sim[1]
    @steve.projected_wins = new9
    @didi.projected_wins = new10

    sim = self.simulate_from_projected(@theresa, @kevin)
    new11 = sim[0]
    new12 = sim[1]
    @theresa.projected_wins = new11
    @kevin.projected_wins = new12

  end

  def self.sim_week15
    sim = self.simulate_from_projected(@miggy, @jarjar)
    new1 = sim[0]
    new2 = sim[1]
    @miggy.projected_wins = new1
    @jarjar.projected_wins = new2

    sim = self.simulate_from_projected(@kevin, @gypsy)
    new3 = sim[0]
    new4 = sim[1]  
    @kevin.projected_wins = new3
    @gypsy.projected_wins = new4

    sim = self.simulate_from_projected(@backyard, @uncle)
    new5 = sim[0]
    new6 = sim[1]
    @backyard.projected_wins = new5
    @uncle.projected_wins = new6

    sim = self.simulate_from_projected(@process, @steve)
    new7 = sim[0]
    new8 = sim[1]
    @process.projected_wins = new7
    @steve.projected_wins = new8

    sim = self.simulate_from_projected(@theresa, @didi)
    new9 = sim[0]
    new10 = sim[1]
    @theresa.projected_wins = new9
    @didi.projected_wins = new10

    sim = self.simulate_from_projected(@dan, @vino)
    new11 = sim[0]
    new12 = sim[1]
    @dan.projected_wins = new11
    @vino.projected_wins = new12

  end

  def self.sim_week16
    sim = self.simulate_from_projected(@miggy, @gypsy)
    new1 = sim[0]
    new2 = sim[1]
    @miggy.projected_wins = new1
    @gypsy.projected_wins = new2

    sim = self.simulate_from_projected(@jarjar, @theresa)
    new3 = sim[0]
    new4 = sim[1]  
    @jarjar.projected_wins = new3
    @theresa.projected_wins = new4

    sim = self.simulate_from_projected(@backyard, @steve)
    new5 = sim[0]
    new6 = sim[1]
    @backyard.projected_wins = new5
    @steve.projected_wins = new6

    sim = self.simulate_from_projected(@process, @vino)
    new7 = sim[0]
    new8 = sim[1]
    @process.projected_wins = new7
    @vino.projected_wins = new8

    sim = self.simulate_from_projected(@kevin, @uncle)
    new9 = sim[0]
    new10 = sim[1]
    @kevin.projected_wins = new9
    @uncle.projected_wins = new10

    sim = self.simulate_from_projected(@dan, @didi)
    new11 = sim[0]
    new12 = sim[1]
    @dan.projected_wins = new11
    @didi.projected_wins = new12

  end

  def self.sim_week17
    sim = self.simulate_from_projected(@miggy, @dan)
    new1 = sim[0]
    new2 = sim[1]
    @miggy.projected_wins = new1
    @dan.projected_wins = new2

    sim = self.simulate_from_projected(@jarjar, @uncle)
    new3 = sim[0]
    new4 = sim[1]  
    @jarjar.projected_wins = new3
    @uncle.projected_wins = new4

    sim = self.simulate_from_projected(@backyard, @process)
    new5 = sim[0]
    new6 = sim[1]
    @backyard.projected_wins = new5
    @process.projected_wins = new6

    sim = self.simulate_from_projected(@theresa, @vino)
    new7 = sim[0]
    new8 = sim[1]
    @theresa.projected_wins = new7
    @vino.projected_wins = new8

    sim = self.simulate_from_projected(@kevin, @didi)
    new9 = sim[0]
    new10 = sim[1]
    @kevin.projected_wins = new9
    @didi.projected_wins = new10

    sim = self.simulate_from_projected(@steve, @gypsy)
    new11 = sim[0]
    new12 = sim[1]
    @steve.projected_wins = new11
    @gypsy.projected_wins = new12

  end

  def self.sim_week18
    sim = self.simulate_from_projected(@miggy, @process)
    new1 = sim[0]
    new2 = sim[1]
    @miggy.projected_wins = new1
    @process.projected_wins = new2

    sim = self.simulate_from_projected(@jarjar, @didi)
    new3 = sim[0]
    new4 = sim[1]  
    @jarjar.projected_wins = new3
    @didi.projected_wins = new4

    sim = self.simulate_from_projected(@backyard, @kevin)
    new5 = sim[0]
    new6 = sim[1]
    @backyard.projected_wins = new5
    @kevin.projected_wins = new6

    sim = self.simulate_from_projected(@steve, @vino)
    new7 = sim[0]
    new8 = sim[1]
    @steve.projected_wins = new7
    @vino.projected_wins = new8

    sim = self.simulate_from_projected(@theresa, @uncle)
    new9 = sim[0]
    new10 = sim[1]
    @theresa.projected_wins = new9
    @uncle.projected_wins = new10

    sim = self.simulate_from_projected(@dan, @gypsy)
    new11 = sim[0]
    new12 = sim[1]
    @dan.projected_wins = new11
    @gypsy.projected_wins = new12

  end

  def self.sim_week19
    sim = self.simulate_from_projected(@miggy, @vino)
    new1 = sim[0]
    new2 = sim[1]
    @miggy.projected_wins = new1
    @vino.projected_wins = new2

    sim = self.simulate_from_projected(@jarjar, @kevin)
    new3 = sim[0]
    new4 = sim[1]  
    @jarjar.projected_wins = new3
    @kevin.projected_wins = new4

    sim = self.simulate_from_projected(@backyard, @theresa)
    new5 = sim[0]
    new6 = sim[1]
    @backyard.projected_wins = new5
    @theresa.projected_wins = new6

    sim = self.simulate_from_projected(@process, @uncle)
    new7 = sim[0]
    new8 = sim[1]
    @process.projected_wins = new7
    @uncle.projected_wins = new8

    sim = self.simulate_from_projected(@steve, @dan)
    new9 = sim[0]
    new10 = sim[1]
    @steve.projected_wins = new9
    @dan.projected_wins = new10

    sim = self.simulate_from_projected(@gypsy, @didi)
    new11 = sim[0]
    new12 = sim[1]
    @gypsy.projected_wins = new11
    @didi.projected_wins = new12

  end

  def self.sim_week20
    sim = self.simulate_from_projected(@miggy, @uncle)
    new1 = sim[0]
    new2 = sim[1]
    @miggy.projected_wins = new1
    @uncle.projected_wins = new2

    sim = self.simulate_from_projected(@jarjar, @backyard)
    new3 = sim[0]
    new4 = sim[1]  
    @jarjar.projected_wins = new3
    @backyard.projected_wins = new4

    sim = self.simulate_from_projected(@didi, @steve)
    new5 = sim[0]
    new6 = sim[1]
    @didi.projected_wins = new5
    @steve.projected_wins = new6

    sim = self.simulate_from_projected(@process, @dan)
    new7 = sim[0]
    new8 = sim[1]
    @process.projected_wins = new7
    @dan.projected_wins = new8

    sim = self.simulate_from_projected(@kevin, @theresa)
    new9 = sim[0]
    new10 = sim[1]
    @kevin.projected_wins = new9
    @theresa.projected_wins = new10

    sim = self.simulate_from_projected(@vino, @gypsy)
    new11 = sim[0]
    new12 = sim[1]
    @vino.projected_wins = new11
    @gypsy.projected_wins = new12

  end

  def self.sim_week21
    sim = self.simulate_from_projected(@miggy, @steve)
    new1 = sim[0]
    new2 = sim[1]
    @miggy.projected_wins = new1
    @steve.projected_wins = new2

    sim = self.simulate_from_projected(@jarjar, @vino)
    new3 = sim[0]
    new4 = sim[1]  
    @jarjar.projected_wins = new3
    @vino.projected_wins = new4

    sim = self.simulate_from_projected(@backyard, @gypsy)
    new5 = sim[0]
    new6 = sim[1]
    @backyard.projected_wins = new5
    @gypsy.projected_wins = new6

    sim = self.simulate_from_projected(@process, @kevin)
    new7 = sim[0]
    new8 = sim[1]
    @process.projected_wins = new7
    @kevin.projected_wins = new8

    sim = self.simulate_from_projected(@didi, @uncle)
    new9 = sim[0]
    new10 = sim[1]
    @didi.projected_wins = new9
    @uncle.projected_wins = new10

    sim = self.simulate_from_projected(@dan, @theresa)
    new11 = sim[0]
    new12 = sim[1]
    @dan.projected_wins = new11
    @theresa.projected_wins = new12

  end

  def self.sim_week22
    sim = self.simulate_from_projected(@miggy, @didi)
    new1 = sim[0]
    new2 = sim[1]
    @miggy.projected_wins = new1
    @didi.projected_wins = new2

    sim = self.simulate_from_projected(@jarjar, @gypsy)
    new3 = sim[0]
    new4 = sim[1]  
    @jarjar.projected_wins = new3
    @gypsy.projected_wins = new4

    sim = self.simulate_from_projected(@backyard, @vino)
    new5 = sim[0]
    new6 = sim[1]
    @backyard.projected_wins = new5
    @vino.projected_wins = new6

    sim = self.simulate_from_projected(@process, @theresa)
    new7 = sim[0]
    new8 = sim[1]
    @process.projected_wins = new7
    @theresa.projected_wins = new8

    sim = self.simulate_from_projected(@kevin, @dan)
    new9 = sim[0]
    new10 = sim[1]
    @kevin.projected_wins = new9
    @dan.projected_wins = new10

    sim = self.simulate_from_projected(@steve, @uncle)
    new11 = sim[0]
    new12 = sim[1]
    @steve.projected_wins = new11
    @uncle.projected_wins = new12

  end

  def self.simulate_from_projected(team1, team2)
    total_1 = team1.projected_wins
    total_2 = team2.projected_wins

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
