class Scraper
  require 'open-uri'
  def self.scrape_yahoo
    teams = []
    doc = Nokogiri::HTML(open("https://baseball.fantasysports.yahoo.com/b1/1243"))
    array = []
    doc.css("tr.Linkable").each do |item|
      array << item
    end
    array.delete_at(0)
    array.delete_at(3)
    array.delete_at(6)
    array.each do |manager|
      team = Team.new
      team.name = manager.css("a[class='Grid-u F-reset Ell Mawpx-250']").text
      team.record = manager.css("td.Nowrap.Ta-c.Px-sm.Tst-wlt").text
      teams << team
    end
  teams
  end
end
