class Team
  attr_accessor :name, :record

  def adjusted_wins
    array = self.record.split("-").map(&:to_f)
    wins = array[0] + (array[2] / 2)
    wins
  end

  def self.sort_by_wins
    @teams = Scraper.scrape_yahoo
    @teams.sort! { |a, b| b.adjusted_wins <=> a.adjusted_wins}
  end

  def self.first_place
    self.sort_by_wins.first
  end

  def games_behind
    Team.first_place.adjusted_wins - self.adjusted_wins
  end

  def self.sort_by_games_behind
    @teams = Team.sort_by_wins
    @teams.each.with_index(1) do |team, i|
      puts "#{i}. #{team.name} - #{team.games_behind} GB"
    end
  end

 end
