#10
def getName(text)
  return text.sub(/[A-Za-z]+:\s/, "") #cleans the String
  #works because functions make a copy, doesnt destroy text
end

# notes:
# Leter efter en godtycklig mängd bokstäver
# som slutar på ": " (inklusive mellanslag)

#11

#Uppgiften säger "hämta" från "dokument". Ni hanterar bara strängar
#men nedan har ni med kommentarer för det
#Detta handlar nog mest om hur ni tolkat uppgiften
#tag_names borde kanske bara vara en hjälpfunktion
def tag_names(text)
  return text.scan(/\<\w+[ \>]/).map { |e| e.gsub(/[^\w]/, "") }.uniq()
end

# test
# require "open-uri.rb"
# html = open("http://www.google.com/") { |f| f.read }
# puts tag_names(html)

# notes:
# text.scan(/\<\w+[ \>]/)
# sparar alla matchande textsegment i en lista
# letar efter öppnings-tag sedan en godtycklig mängd
# tecken före mellanslag eller stängningstagg
#
# e.gsub(/[^\w]/, "") körs sedan på varje element och
# tar bort alla tecken som inte är alfanumeriska

#ska returnera regnummer, inte true
#sedan 2017:
#kan ha formatet AAA11A
#sista bokstaven får inte vara O

#Skulle man undvika =~ ?

def regnr(string)
  return (string =~ /[A-HJ-PR-UW-Z]{3}[0-9]{3}/) ? true : false
end

puts regnr("AIA678")
puts regnr("AVA678")
