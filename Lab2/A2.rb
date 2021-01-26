require "rexml/document"

class Event
  def initialize()
    @event_hash = Hash.new
  end

  def add_field(key, value)
    @event_hash[key] = value
  end
  
  def to_s
    str = ""
    @event_hash.each do |key, value|
      str += "#{key}: #{value}\n"
    end
    return str
  end
  
end

def xhtml_read(website)
  src = File.open website
  doc = REXML::Document.new src
  event_list = Array.new
  #Pontus exemple
  #events = doc.get_elements("//div[@class='vevent']/*|//span[@class='vevent']/*")
  doc.elements.each("//div[@class='vevent']") do |element|
    event = Event.new
    event.add_field("Name", element.elements[".//span[@class='summary']"].text)
    event.add_field("Date", element.elements[".//span[@class='dtstart']"].text)
    location = ""
    element.each_element(".//td[@class='location']//")  do |l|
      if (l.has_text?) && (l.text.gsub(/\n/,'').strip != "")
        location += "#{l.text}, "
      end
    end
    event.add_field("Location", location[0...-2])
    event.add_field("Description", element.elements[".//td[@class='description']/p"].text)
    event.add_field("Posted by", element.elements[".//a[@class='userLink ']"].text)
    
    event_list << event
  end

  #print evens
  for e in (0...event_list.size)
    puts "Event #{e + 1}\n#{"="*8}\n#{event_list[e]}\n"
  end
end

xhtml_read("events.html")
