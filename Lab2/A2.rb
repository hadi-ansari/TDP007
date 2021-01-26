require "rexml/document"

def xhtml_read(website)
  src = File.open website
  doc = REXML::Document.new src
  event_list = Array.new
  #Pontus exemple
  #events = doc.get_elements("//div[@class='vevent']/*|//span[@class='vevent']/*")
  doc.elements.each("//div[@class='vevent']") do |event|
    event_hash = Hash.new
    event_hash["name"] = event.elements[".//span[@class='summary']"].text
    event_hash["dstart"] = event.elements[".//span[@class='dtstart']"].text
    event_hash["location"] = ""
    event.each_element(".//td[@class='location']//")  do |l|
      if (l.has_text?) then
        if (l.text.gsub(/\n/,'').strip) != ""
          event_hash["location"] += " #{l.text.gsub(/\n/,'').strip}"
        end
      end
    end
    event.each_element(".//td[@class='description']") do |l|
      event_hash["description"] = l.elements[1].text
    end
    event.each_element(".//a[@class='userLink ']") do |l|
      event_hash["Posted by"] = l.text
    end
    
    event_list << event_hash
  end

  #Print events
  for i in (0...event_list.size)
    puts "Event #{i+1}\n#{"="*8}\nDate: #{event_list[i]["dstart"]}\nName: #{event_list[i]["name"]}\nLocation: #{event_list[i]["location"]}\nDescription: #{event_list[i]["description"]}\nPosted by: #{event_list[i]["Posted by"]}\n\n"

  end
end

xhtml_read("events.html")
