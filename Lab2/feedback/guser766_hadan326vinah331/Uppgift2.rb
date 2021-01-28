require 'rexml/document'

#Lösningen är kort och elegant, men något förenklad.
#De hämtar bara ut information som finns i alla event.
#T ex location ser olika ut, men locality kan man hämta ut i alla event.
#Blackbox hade vi förväntat oss att infon skulle matcha det man ser när man
#klickar in kalendern, vilket skiljer sig åt.
#Info utebliver, och vi hade gärna sett hantering av specialfallen.
def event_catcher(source)
  #Hade varit bättre med en lista med event, istället för 4 olika listor för
  #de olika värdena
    sum = "//div[@class='vevent']//span[@class='summary']"
    dat = "//div[@class='vevent']//span[@class='dtstart']"
    loc = "//div[@class='vevent']//span[@class='locality']"
    desc = "//div[@class='vevent']//td[@class='description']//p"

    objects = []
    source.elements.each(sum) { objects.append Hash.new() }

    source.elements.each_with_index(sum) { |info, index| objects[index]["Event name"] = info.text}
    source.elements.each_with_index(dat) { |info, index| objects[index]["Date"] = info.text}
    source.elements.each_with_index(loc) { |info, index| objects[index]["Location"] = info.text}
    source.elements.each_with_index(desc) { |info, index| objects[index]["Description"] = info.text}

    return objects
end

def print_events(events)
    events.each do | event |
        event.each do |title, info|
            puts "#{title}: #{info}"
        end
        puts
    end
end
