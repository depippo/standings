class Challenger
  attr_accessor :id, :name, :record, :odds, :week, :adjusted_wins, :projected_wins, :power

    @challengers = []

    @jarjar = Challenger.new
    @jarjar.name = "Jar Jar Tartare"
    @jarjar.record =  "126-59-7"
    @jarjar.power = 11.083
    @challengers << @jarjar

    @gypsy = Challenger.new
    @gypsy.name = "Gypsy Danger"
    @gypsy.record =  "94-88-10"
    @gypsy.power = 7.583
    @challengers << @gypsy

    @vino = Challenger.new
    @vino.name = "Vino"
    @vino.record =  "80-107-5"
    @vino.power = 4.583
    @challengers << @vino

    @backyard = Challenger.new
    @backyard.name = "Backyards Loseagains"
    @backyard.record =  "78-107-7"
    @backyard.power = 5.75
    @challengers << @backyard

    @miggy = Challenger.new
    @miggy.name = "Miggy Stardust"
    @miggy.record =  "101-81-10"
    @miggy.power = 9.167
    @challengers << @miggy

    @uncle = Challenger.new
    @uncle.name = "Uncle Charlie"
    @uncle.record =  "107-75-10"
    @uncle.power = 7.333
    @challengers << @uncle

    @didi = Challenger.new
    @didi.name = "Sir Didi's Sleepers"
    @didi.record =  "79-102-11"
    @didi.power = 5.583
    @challengers << @didi

    @steve = Challenger.new
    @steve.name = "SOS"
    @steve.record =  "69-115-8"
    @steve.power = 4.167
    @challengers << @steve

    @theresa = Challenger.new
    @theresa.name = "Keep it n your pence"
    @theresa.record =  "118-67-7"
    @theresa.power = 9.333
    @challengers << @theresa

    @process = Challenger.new
    @process.name = "Trust The Process"
    @process.record =  "98-84-10"
    @process.power = 4.667
    @challengers << @process

    @kevin = Challenger.new
    @kevin.name = "Swipe Left"
    @kevin.record =  "84-100-8"
    @kevin.power = 5.333
    @challengers << @kevin

    @dan = Challenger.new
    @dan.name = "Team Emoji"
    @dan.record =  "67-116-9"
    @dan.power = 3.417
    @challengers << @dan

  def adjusted_wins
    array = self.record.split("-").map(&:to_f)
    wins = array[0] + (array[2] / 2)
    wins
  end

  def self.simulate
    playoffs = []
    10000.times {
      self.run_simulation
      Challenger.sort_by_wins[0..5].each do |team|
        playoffs << team.name
      end
    }
    jar = (playoffs.count("Jar Jar Tartare").to_f / 10000)
    theresa = (playoffs.count("Keep it n your pence").to_f / 10000)
    miggy = (playoffs.count("Miggy Stardust").to_f / 10000)
    uncle = (playoffs.count("Uncle Charlie").to_f / 10000)
    process = (playoffs.count("Trust The Process").to_f / 10000)
    kevin = (playoffs.count("Swipe Left").to_f / 10000)
    gypsy = (playoffs.count("Gypsy Danger").to_f / 10000)
    dan = (playoffs.count("Team Emoji").to_f / 10000)
    vino = (playoffs.count("Vino").to_f / 10000)
    didi = (playoffs.count("Sir Didi's Sleepers").to_f / 10000)
    backyard = (playoffs.count("Backyards Loseagains").to_f / 10000)
    steve = (playoffs.count("SOS").to_f / 10000)
    puts jar
    puts theresa
    puts miggy
    puts uncle
    puts process
    puts kevin
    puts gypsy
    puts dan
    puts vino
    puts didi
    puts backyard
    puts steve

  end

  def self.run_simulation
    # self.sim_week12
    # self.sim_week13
    # self.sim_week14
    # self.sim_week15
    # self.sim_week16
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
    sim = self.simulate_match(@miggy, @didi)
    new1 = sim[0]
    new2 = sim[1]
    @miggy.projected_wins = new1
    @didi.projected_wins = new2

    sim = self.simulate_match(@jarjar, @gypsy)
    new3 = sim[0]
    new4 = sim[1]  
    @jarjar.projected_wins = new3
    @gypsy.projected_wins = new4

    sim = self.simulate_match(@backyard, @vino)
    new5 = sim[0]
    new6 = sim[1]
    @backyard.projected_wins = new5
    @vino.projected_wins = new6

    sim = self.simulate_match(@process, @theresa)
    new7 = sim[0]
    new8 = sim[1]
    @process.projected_wins = new7
    @theresa.projected_wins = new8

    sim = self.simulate_match(@steve, @uncle)
    new9 = sim[0]
    new10 = sim[1]
    @steve.projected_wins = new9
    @uncle.projected_wins = new10

    sim = self.simulate_match(@dan, @kevin)
    new11 = sim[0]
    new12 = sim[1]
    @dan.projected_wins = new11
    @kevin.projected_wins = new12

  end

  def self.sim_week14
    sim = self.simulate_match(@miggy, @uncle)
    new1 = sim[0]
    new2 = sim[1]
    @miggy.projected_wins = new1
    @uncle.projected_wins = new2

    sim = self.simulate_match(@jarjar, @backyard)
    new3 = sim[0]
    new4 = sim[1]  
    @jarjar.projected_wins = new3
    @backyard.projected_wins = new4

    sim = self.simulate_match(@gypsy, @vino)
    new5 = sim[0]
    new6 = sim[1]
    @gypsy.projected_wins = new5
    @vino.projected_wins = new6

    sim = self.simulate_match(@process, @dan)
    new7 = sim[0]
    new8 = sim[1]
    @process.projected_wins = new7
    @dan.projected_wins = new8

    sim = self.simulate_match(@steve, @didi)
    new9 = sim[0]
    new10 = sim[1]
    @steve.projected_wins = new9
    @didi.projected_wins = new10

    sim = self.simulate_match(@theresa, @kevin)
    new11 = sim[0]
    new12 = sim[1]
    @theresa.projected_wins = new11
    @kevin.projected_wins = new12

  end

  def self.sim_week15
    sim = self.simulate_match(@miggy, @jarjar)
    new1 = sim[0]
    new2 = sim[1]
    @miggy.projected_wins = new1
    @jarjar.projected_wins = new2

    sim = self.simulate_match(@kevin, @gypsy)
    new3 = sim[0]
    new4 = sim[1]  
    @kevin.projected_wins = new3
    @gypsy.projected_wins = new4

    sim = self.simulate_match(@backyard, @uncle)
    new5 = sim[0]
    new6 = sim[1]
    @backyard.projected_wins = new5
    @uncle.projected_wins = new6

    sim = self.simulate_match(@process, @steve)
    new7 = sim[0]
    new8 = sim[1]
    @process.projected_wins = new7
    @steve.projected_wins = new8

    sim = self.simulate_match(@theresa, @didi)
    new9 = sim[0]
    new10 = sim[1]
    @theresa.projected_wins = new9
    @didi.projected_wins = new10

    sim = self.simulate_match(@dan, @vino)
    new11 = sim[0]
    new12 = sim[1]
    @dan.projected_wins = new11
    @vino.projected_wins = new12

  end

  def self.sim_week16
    sim = self.simulate_match(@miggy, @gypsy)
    new1 = sim[0]
    new2 = sim[1]
    @miggy.projected_wins = new1
    @gypsy.projected_wins = new2

    sim = self.simulate_match(@jarjar, @theresa)
    new3 = sim[0]
    new4 = sim[1]  
    @jarjar.projected_wins = new3
    @theresa.projected_wins = new4

    sim = self.simulate_match(@backyard, @steve)
    new5 = sim[0]
    new6 = sim[1]
    @backyard.projected_wins = new5
    @steve.projected_wins = new6

    sim = self.simulate_match(@process, @vino)
    new7 = sim[0]
    new8 = sim[1]
    @process.projected_wins = new7
    @vino.projected_wins = new8

    sim = self.simulate_match(@kevin, @uncle)
    new9 = sim[0]
    new10 = sim[1]
    @kevin.projected_wins = new9
    @uncle.projected_wins = new10

    sim = self.simulate_match(@dan, @didi)
    new11 = sim[0]
    new12 = sim[1]
    @dan.projected_wins = new11
    @didi.projected_wins = new12

  end

  def self.sim_week17
    sim = self.simulate_match(@miggy, @dan)
    new1 = sim[0]
    new2 = sim[1]
    @miggy.projected_wins = new1
    @dan.projected_wins = new2

    sim = self.simulate_match(@jarjar, @uncle)
    new3 = sim[0]
    new4 = sim[1]  
    @jarjar.projected_wins = new3
    @uncle.projected_wins = new4

    sim = self.simulate_match(@backyard, @process)
    new5 = sim[0]
    new6 = sim[1]
    @backyard.projected_wins = new5
    @process.projected_wins = new6

    sim = self.simulate_match(@theresa, @vino)
    new7 = sim[0]
    new8 = sim[1]
    @theresa.projected_wins = new7
    @vino.projected_wins = new8

    sim = self.simulate_match(@kevin, @didi)
    new9 = sim[0]
    new10 = sim[1]
    @kevin.projected_wins = new9
    @didi.projected_wins = new10

    sim = self.simulate_match(@steve, @gypsy)
    new11 = sim[0]
    new12 = sim[1]
    @steve.projected_wins = new11
    @gypsy.projected_wins = new12

  end

  def self.sim_week18
    sim = self.simulate_from_projected(@miggy, @process, 17)
    new1 = sim[0]
    new2 = sim[1]
    @miggy.projected_wins = new1
    @process.projected_wins = new2

    sim = self.simulate_from_projected(@jarjar, @didi, 17)
    new3 = sim[0]
    new4 = sim[1]  
    @jarjar.projected_wins = new3
    @didi.projected_wins = new4

    sim = self.simulate_from_projected(@backyard, @kevin, 17)
    new5 = sim[0]
    new6 = sim[1]
    @backyard.projected_wins = new5
    @kevin.projected_wins = new6

    sim = self.simulate_from_projected(@steve, @vino, 17)
    new7 = sim[0]
    new8 = sim[1]
    @steve.projected_wins = new7
    @vino.projected_wins = new8

    sim = self.simulate_from_projected(@theresa, @uncle, 17)
    new9 = sim[0]
    new10 = sim[1]
    @theresa.projected_wins = new9
    @uncle.projected_wins = new10

    sim = self.simulate_from_projected(@dan, @gypsy, 17)
    new11 = sim[0]
    new12 = sim[1]
    @dan.projected_wins = new11
    @gypsy.projected_wins = new12

  end

  def self.sim_week19
    sim = self.simulate_from_projected(@miggy, @vino, 18)
    new1 = sim[0]
    new2 = sim[1]
    @miggy.projected_wins = new1
    @vino.projected_wins = new2

    sim = self.simulate_from_projected(@jarjar, @kevin, 18)
    new3 = sim[0]
    new4 = sim[1]  
    @jarjar.projected_wins = new3
    @kevin.projected_wins = new4

    sim = self.simulate_from_projected(@backyard, @theresa, 18)
    new5 = sim[0]
    new6 = sim[1]
    @backyard.projected_wins = new5
    @theresa.projected_wins = new6

    sim = self.simulate_from_projected(@process, @uncle, 18)
    new7 = sim[0]
    new8 = sim[1]
    @process.projected_wins = new7
    @uncle.projected_wins = new8

    sim = self.simulate_from_projected(@steve, @dan, 18)
    new9 = sim[0]
    new10 = sim[1]
    @steve.projected_wins = new9
    @dan.projected_wins = new10

    sim = self.simulate_from_projected(@gypsy, @didi, 18)
    new11 = sim[0]
    new12 = sim[1]
    @gypsy.projected_wins = new11
    @didi.projected_wins = new12

  end

  def self.sim_week20
    sim = self.simulate_from_projected(@miggy, @uncle, 19)
    new1 = sim[0]
    new2 = sim[1]
    @miggy.projected_wins = new1
    @uncle.projected_wins = new2

    sim = self.simulate_from_projected(@jarjar, @backyard, 19)
    new3 = sim[0]
    new4 = sim[1]  
    @jarjar.projected_wins = new3
    @backyard.projected_wins = new4

    sim = self.simulate_from_projected(@didi, @steve, 19)
    new5 = sim[0]
    new6 = sim[1]
    @didi.projected_wins = new5
    @steve.projected_wins = new6

    sim = self.simulate_from_projected(@process, @dan, 19)
    new7 = sim[0]
    new8 = sim[1]
    @process.projected_wins = new7
    @dan.projected_wins = new8

    sim = self.simulate_from_projected(@kevin, @theresa, 19)
    new9 = sim[0]
    new10 = sim[1]
    @kevin.projected_wins = new9
    @theresa.projected_wins = new10

    sim = self.simulate_from_projected(@vino, @gypsy, 19)
    new11 = sim[0]
    new12 = sim[1]
    @vino.projected_wins = new11
    @gypsy.projected_wins = new12

  end

  def self.sim_week21
    sim = self.simulate_from_projected(@miggy, @steve, 20)
    new1 = sim[0]
    new2 = sim[1]
    @miggy.projected_wins = new1
    @steve.projected_wins = new2

    sim = self.simulate_from_projected(@jarjar, @vino, 20)
    new3 = sim[0]
    new4 = sim[1]  
    @jarjar.projected_wins = new3
    @vino.projected_wins = new4

    sim = self.simulate_from_projected(@backyard, @gypsy, 20)
    new5 = sim[0]
    new6 = sim[1]
    @backyard.projected_wins = new5
    @gypsy.projected_wins = new6

    sim = self.simulate_from_projected(@process, @kevin, 20)
    new7 = sim[0]
    new8 = sim[1]
    @process.projected_wins = new7
    @kevin.projected_wins = new8

    sim = self.simulate_from_projected(@didi, @uncle, 20)
    new9 = sim[0]
    new10 = sim[1]
    @didi.projected_wins = new9
    @uncle.projected_wins = new10

    sim = self.simulate_from_projected(@dan, @theresa, 20)
    new11 = sim[0]
    new12 = sim[1]
    @dan.projected_wins = new11
    @theresa.projected_wins = new12

  end

  def self.sim_week22
    sim = self.simulate_from_projected(@miggy, @didi, 21)
    new1 = sim[0]
    new2 = sim[1]
    @miggy.projected_wins = new1
    @didi.projected_wins = new2

    sim = self.simulate_from_projected(@jarjar, @gypsy, 21)
    new3 = sim[0]
    new4 = sim[1]  
    @jarjar.projected_wins = new3
    @gypsy.projected_wins = new4

    sim = self.simulate_from_projected(@backyard, @vino, 21)
    new5 = sim[0]
    new6 = sim[1]
    @backyard.projected_wins = new5
    @vino.projected_wins = new6

    sim = self.simulate_from_projected(@process, @theresa, 21)
    new7 = sim[0]
    new8 = sim[1]
    @process.projected_wins = new7
    @theresa.projected_wins = new8

    sim = self.simulate_from_projected(@kevin, @dan, 21)
    new9 = sim[0]
    new10 = sim[1]
    @kevin.projected_wins = new9
    @dan.projected_wins = new10

    sim = self.simulate_from_projected(@steve, @uncle, 21)
    new11 = sim[0]
    new12 = sim[1]
    @steve.projected_wins = new11
    @uncle.projected_wins = new12

  end

  def self.simulate_from_projected(team1, team2, weeks_completed)
    total_1 = team1.projected_wins
    total_2 = team2.projected_wins

    # team_record1 = total_1 / weeks_completed
    # team_record2 = total_2 / weeks_completed

    # adjusted1 = (team_record1 - 6)
    # adjusted1 /= 10
    # adjusted1 += 6

    # adjusted2 = (team_record2 - 6)
    # adjusted2 /= 10
    # adjusted2 += 6

    adjusted1 = (team1.power - 6)
    adjusted1 /= 2
    adjusted1 += 6

    adjusted2 = (team2.power - 6)
    adjusted2 /= 2
    adjusted2 += 6

    gen1 = Rubystats::NormalDistribution.new(adjusted1, 4)
    team_score1 = gen1.rng               # a single random sample

    gen2 = Rubystats::NormalDistribution.new(adjusted2, 4)
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

    # team_record1 = total_1 / 11
    # team_record2 = total_2 / 11

    # adjusted1 = (team_record1 - 6)
    # adjusted1 /= 10
    # adjusted1 += 6

    # adjusted2 = (team_record2 - 6)
    # adjusted2 /= 10
    # adjusted2 += 6

    adjusted1 = (team1.power - 6)
    adjusted1 /= 2
    adjusted1 += 6

    adjusted2 = (team2.power - 6)
    adjusted2 /= 2
    adjusted2 += 6



    gen1 = Rubystats::NormalDistribution.new(adjusted1, 4)
    team_score1 = gen1.rng               # a single random sample

    gen2 = Rubystats::NormalDistribution.new(adjusted2, 4)
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
