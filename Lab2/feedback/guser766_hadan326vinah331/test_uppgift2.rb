require 'test/unit'
require './Uppgift2.rb'

class TestUppgift2 < Test::Unit::TestCase
    def test_uppgift2
        src = File.open("events.html")
        doc = REXML::Document.new src
        root = doc.root()

        #Ni testade om det var skillnad på doc/root, men det hade ni inte behövt
        #ha med i testfilen på slutet. 
        doc_test = event_catcher(doc)
        assert_equal("The Dark Carnival - 101.9FM", doc_test[0]["Event name"])
        assert_equal("Sinister Sundays", doc_test[1]["Event name"])
        assert_equal("2008-01-04 10:00pm EST", doc_test[0]["Date"])
        assert_equal("Belleville", doc_test[1]["Location"])
        assert_equal("Gothic, Industrial, Dark Alternative w/ DJ LunaSlave", doc_test[3]["Description"])
        assert_equal(8, doc_test.length()) #bra, här testas längd

        root_test = event_catcher(root)
        assert_equal("The Dark Carnival - 101.9FM", root_test[0]["Event name"])
        assert_equal("Sinister Sundays", root_test[1]["Event name"])
        assert_equal("2008-01-04 10:00pm EST", root_test[0]["Date"])
        assert_equal("Belleville", root_test[1]["Location"])
        assert_equal("Gothic, Industrial, Dark Alternative w/ DJ LunaSlave", root_test[3]["Description"])
        assert_equal(8, root_test.length())


        assert_equal("Kingston", doc_test[0]["Location"])
    end

end
