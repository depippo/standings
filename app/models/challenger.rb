class Challenger
  attr_accessor :id, :name, :record, :odds, :week

  def adjusted_wins
    array = self.record.split("-").map(&:to_f)
    wins = array[0] + (array[2] / 2)
    wins
  end

  def self.show_challengers
    @challengers = Scraper.retrieve_challengers
  end


  # weeks_remaining = 12
  # weeks_finished = 10
  # weeks_to_simulate = (22 - current_week)


def simulate

  # @challengers.each do |challenger|

end




  def self.random_matchup
    teams = []
    until teams.length == 2
      placeholder = @challengers.sample
      if !teams.include?(placeholder)
        teams << @challengers.sample
      end
    end
    return teams
   end

  def average_wins_per_week(adjusted_wins, current_week)
    adjusted_wins / current_week
  end

  def self.simulate_match

    team_record1 = 8.1
    team_record2 = 3.6

    total_1 = 81
    total_2 = 36

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
    puts dif
 
    puts dif.round

  
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

  puts total_1
  puts total_2


  end

  def self.simulate_match2
    gen = Rubystats::NormalDistribution.new(321, 100)
    return gen.rng               # a single random sample
  end

  def self.compare
    dif = self.simulate_match - self.simulate_match2
    25.times {
      puts dif
    }  
  end


 end
