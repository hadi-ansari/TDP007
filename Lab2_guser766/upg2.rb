require "nokogiri"

doc = Nokogiri::HTML("Events Calendar _ rosebleed.net.html")

puts doc
# doc.xpath('//td', '//article//h2').each do |link|
#   puts link.content
# end
