class Scraper
  require 'open-uri'

  attr_accessor :leaders

  @doc = Nokogiri::HTML(open("https://baseball.fantasysports.yahoo.com/b1/10912"))
  
  def self.scrape_yahoo
    teams = []
    @leaders = []
    # @challengers = []
    
    array = []
    @doc.css("tr.Linkable").each do |item|
      array << item
    end

    save_leaders(array[0])
    save_leaders(array[4])
    save_leaders(array[8])

    # save_challengers(array)

    # save_week

    array.delete_at(0)
    array.delete_at(3)
    array.delete_at(6)
    array[0..3].each do |manager|
      team = Team.new
      team.name = manager.css("a[class='Grid-u F-reset Ell Mawpx-250']").text
      team.record = manager.css("td.Nowrap.Ta-c.Px-sm.Tst-wlt").text
      team.rank = manager.css("td.First.Ta-c.Px-sm.Tst-rank.Relative").text
      team.division = "East"
      teams << team
    end
    array[4..7].each do |manager|
      team = Team.new
      team.name = manager.css("a[class='Grid-u F-reset Ell Mawpx-250']").text
      if team.name.include?("ð±ð¿ðð¨ð»ð¨ð¿ââï¸ð¦ð»")
        team.name = "Team Emoji"
      elsif team.name == "ð"
        team.name = "SOS"
      else
        team.name.gsub!("ð´", "")
      end
      team.record = manager.css("td.Nowrap.Ta-c.Px-sm.Tst-wlt").text
      team.rank = manager.css("td.First.Ta-c.Px-sm.Tst-rank.Relative").text
      team.division = "Central"
      teams << team
    end
    array[8..11].each do |manager|
      team = Team.new
      team.name = manager.css("a[class='Grid-u F-reset Ell Mawpx-250']").text
      if team.name.include?("ð±ð¿ðð¨ð»ð¨ð¿ââï¸ð¦ð»")
        team.name = "Team Emoji"
      else
        team.name.gsub!("ð´", "")
      end
      team.record = manager.css("td.Nowrap.Ta-c.Px-sm.Tst-wlt").text
      team.rank = manager.css("td.First.Ta-c.Px-sm.Tst-rank.Relative").text
      team.division = "West"
      teams << team
    end
  teams
  end

  def self.save_leaders(manager)
      leader = Leader.new
      leader.name = manager.css("a[class='Grid-u F-reset Ell Mawpx-250']").text
      if leader.name.include?("ð±ð¿ðð¨ð»ð¨ð¿ââï¸ð¦ð»")
        leader.name = "Team Emoji"
      else
        leader.name.gsub!("ð´", "")
        leader.name.gsub!("â¨", "")
      end
      leader.record = manager.css("td.Nowrap.Ta-c.Px-sm.Tst-wlt").text
      leader.rank = manager.css("td.First.Ta-c.Px-sm.Tst-rank.Relative").text
      leader.division = "East"
      @leaders << leader
  end

  # def self.save_challengers(array)
  #   array.each do |manager|
  #     challenger = Challenger.new
  #     challenger.name = manager.css("a[class='Grid-u F-reset Ell Mawpx-250']").text
  #     if challenger.name.include?("ð±ð¿ðð¨ð»ð¨ð¿ââï¸ð¦ð»")
  #       challenger.name = "Team Emoji"
  #     else
  #       challenger.name.gsub!("ð´", "")
  #       challenger.name.gsub!("â¨", "")
  #     end
  #     challenger.record = manager.css("td.Nowrap.Ta-c.Px-sm.Tst-wlt").text

  #     h = manager.css('a[href]').each_with_object({}) { |n, h| h[n.text.strip] = n['href'] }
  #     raw =  h.values[0]
  #     raw_id = raw.gsub!("/b1/10912/", "")

  #     challenger.id = raw_id.to_i
  #     @challengers << challenger
  #   end
  # end

  # def self.save_week
  #   week = @doc.css("span[class='Inlineblock Va-mid']").text
  #   week.gsub!("Week ", "")
  #   week.gsub!(" Matchups", "")
  #   return week
  # end

  def self.retrieve_leaders
    return @leaders
  end

  # def self.retrieve_challengers
  #   return @challengers
  # end

end

