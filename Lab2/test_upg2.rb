require './upg2'
require 'test/unit'

class TestUpg2 < Test::Unit::TestCase
  def number_of_events()
    event_list = xhtml_read("events.html")
    assert_equal(8, event_list.size)
  end

  def check_event_content()
    
  end
end
