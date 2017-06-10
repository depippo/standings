class Scraper
  require 'open-uri'
  def self.scrape_yahoo
    teams = []
    leaders = []
    doc = Nokogiri::HTML(open("https://baseball.fantasysports.yahoo.com/b1/10912"))
    array = []
    doc.css("tr.Linkable").each do |item|
      array << item
    end
    print array[0]
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
      team.record = manager.css("td.Nowrap.Ta-c.Px-sm.Tst-wlt").text
      team.rank = manager.css("td.First.Ta-c.Px-sm.Tst-rank.Relative").text
      team.division = "Central"
      teams << team
    end
    array[8..11].each do |manager|
      team = Team.new
      team.name = manager.css("a[class='Grid-u F-reset Ell Mawpx-250']").text
      team.record = manager.css("td.Nowrap.Ta-c.Px-sm.Tst-wlt").text
      team.rank = manager.css("td.First.Ta-c.Px-sm.Tst-rank.Relative").text
      team.division = "West"
      teams << team
    end
  teams
  end
end

