require "./a1"
require "./a2"
require "./a3"
require "./a4"

require "test/unit"

require "date"

#u1
class TestU1 < Test::Unit::TestCase
  def test_one
    value = 0
    n_times(1) { value += 1 }
    assert_equal(value, 1)

    value = 0
    n_times(10) { value += 1 }
    assert_equal(value, 10)

    value = 0
    n_times(0) { value += 1 }
    assert_equal(value, 0)
  end

  def test_two
    value = 0
    do_three = Repeat.new(3)
    do_three.each { value += 1 }
    assert_equal(value, 3)

    value = 0
    do_three.each { value += 3 }
    assert_equal(value, 9)

    value = 0
    do_zero = Repeat.new(0)
    do_zero.each { value += 1 }
    assert_equal(value, 0)

    value = 0
    do_minus_one = Repeat.new(-1)
    do_minus_one.each { value += 1 }
    assert_equal(value, 0)

    value = 0
    do_ten = Repeat.new(10)
    do_ten.each { value += 1 }
    assert_equal(value, 10)
  end
end

#u2
class TestU2 < Test::Unit::TestCase
  def test_one
    assert_equal(1, factorial(-1))
    assert_equal(1, factorial(0))
    assert_equal(1, factorial(1))
    assert_equal(120, factorial(5))
  end
end

#u3
class TestU3 < Test::Unit::TestCase
  def test_one
    assert_equal("apelsin", longest_string(["banan", "apelsin", "citron"]))
    assert_equal("aaa", longest_string(["aa", "a", "aaa"]))
    assert_equal("a", longest_string(["a", "a", "a"]))
    assert_equal("", longest_string(["", "", ""]))
  end
end

#u5
class TestU5 < Test::Unit::TestCase
  def test_one
    personName = PersonName.new("First", "Last")
    assert_equal("First Last", personName.getFullName())
    personName.setFullName("F L")
    assert_equal("F L", personName.getFullName())
  end
end

#u6
# testet fungerar bara år 2021
class TestU6 < Test::Unit::TestCase
  def test_one
    person = Person.new("First", "Last", 22)
    assert_equal(22, person.getAge())
    assert_equal(Time.new().year() - person.getAge(), person.getBirthyear()) #kanske dumt att kontrollen beror på en funktion i klassen, tänk om vänsterled blir fel?

    person.setAge(25)
    assert_equal(25, person.getAge())
    assert_equal(Time.new().year() - person.getAge(), person.getBirthyear())

    person.setAge(0)
    assert_equal(0, person.getAge())
    assert_equal(Time.new().year(), person.getBirthyear())
  end
end

#u7
class TestU7 < Test::Unit::TestCase
  def test_one
    assert_equal(0, 0.fib())
    assert_equal(1, 1.fib())
    assert_equal(1, 2.fib())
    assert_equal(5, 5.fib())
    assert_equal(8, 6.fib())
    assert_equal(28657, 23.fib())
  end
end

#u8
class TestU8 < Test::Unit::TestCase
  def test_one
    assert_equal("LOL", "Laugh out loud".acronym())
    assert_equal("DWIM", "Do what I mean!!".acronym())
    assert_equal("THG", "Test Hej Gggg".acronym())
    assert_equal("THG", "test hej Gggg".acronym())
    assert_equal("T", "t".acronym())
    assert_equal("", "".acronym())
  end
end

#u10
class TestU10 < Test::Unit::TestCase
  def test_one
    assert_equal("Brian", getName("USERNAME: Brian"))
    assert_equal("Brian", getName("NAME: Brian"))
    assert_equal("Brian", getName("name: Brian"))
    assert_equal("Brian", getName("naME: Brian"))
    assert_not_equal("Brian", getName("na ME: Brian"))
    assert_not_equal("Brian", getName(": Brian"))
    assert_not_equal("Brian", getName(":Brian"))

    s = "Username: Gustav"
    getName(s)
    assert_equal("Username: Gustav", s)
  end
end

#u11
class TestU11 < Test::Unit::TestCase
  def test_one
    text = "<html>"
    assert_equal(["html"], tag_names(text))

    text = "<html> asdf <a id='test'> </a> <div class='asdf'></div>"
    assert_equal(["html", "a", "div"], tag_names(text))

    text = ""
    assert_equal([], tag_names(text))
  end
end

#u12
class TestU12 < Test::Unit::TestCase
  def test_one
    assert_equal(false, regnr("AVA678"))
    assert_equal(false, regnr("AQA678"))
    assert_equal(false, regnr("AIA678"))
    assert_equal(false, regnr(""))
    assert_equal(false, regnr("hej"))
    assert_equal(false, regnr("hha678"))

    assert_equal(true, regnr("HHA678a"))
    assert_equal(true, regnr("hejHHA678"))
    assert_equal(true, regnr("HHA6788"))
    assert_equal(true, regnr("hejHHA678hej"))
    assert_equal(true, regnr("HHA678"))
  end
end
