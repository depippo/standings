class Team
  attr_accessor :name, :record, :division, :rank

  def adjusted_wins
    array = self.record.split("-").map(&:to_f)
    wins = array[0] + (array[2] / 2)
    wins
  end



  def self.retrieve_teams
    @teams = Scraper.scrape_yahoo
    return @teams
  end

  def self.sort_by_wins
    @teams = Team.retrieve_teams
    @teams.sort! { |a, b| b.adjusted_wins <=> a.adjusted_wins}
  end


  def self.third_place
    self.sort_by_wins.third
  end

  def games_behind
    Team.third_place.adjusted_wins - self.adjusted_wins
  end

  def games_ahead
    self.adjusted_wins - Team.third_place.adjusted_wins
  end

  def self.sort_by_games_behind
    @teams = Team.sort_by_wins
    @teams.each.with_index(1) do |team, i|
      puts "#{i}. #{team.name} - #{team.games_behind} GB"
    end
  end

 end
