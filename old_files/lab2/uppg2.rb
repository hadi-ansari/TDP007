require "rexml/document"

def xhtml_read(website)
  src = File.open website
  doc = REXML::Document.new src
  event_list = Array.new
  #r = doc.root
  #doc.elements.each("/html/body/table") { |n| puts n.text }
  events = doc.get_elements("//div[@class='vevent']/*|//span[@class='vevent']/*")
  events.each do |event|
    event_hash = Hash.new
    event_hash["name"] = event.elements[".//span[@class='summary']"].text
    event_hash["dstart"] = event.elements[".//[@class='dtstart']"].text
    event_hash["location"] = ""
    event.each_element(".//td[@class='location']//")  do |l|
      if (l.has_text?) then
        if (l.text.gsub(/\n/,'').strip) != ""
        event_hash["location"] += " #{l.text.gsub(/\n/,'').strip}"
        end
      end
    end
    event_list << event_hash
  end
  puts event_list
end

xhtml_read("events.html")
