class Leader
  attr_accessor :name, :record, :division, :rank

  def adjusted_wins
    array = self.record.split("-").map(&:to_f)
    wins = array[0] + (array[2] / 2)
    wins
  end

  # def self.retrieve_leaders
  #   @teams = Scraper.scrape_yahoo
  #   return @teams
  # end

  def self.sort_by_wins
    @leader = Leader.show_leaders
    @leaders.sort! { |a, b| b.adjusted_wins <=> a.adjusted_wins}
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
    @leaders = Leader.show_leaders
    @leaders.each.with_index(1) do |team, i|
      puts "#{i}. #{team.name} - #{team.games_behind} GB"
    end
  end

  def self.show_leaders
    @leaders = Scraper.retrieve_leaders
  end

  def self.one_seed
    Leader.sort_by_wins[0]
  end

  def self.two_seed
    Leader.sort_by_wins[1]
  end

  def self.three_seed
    Leader.sort_by_wins[2]
  end

 end
