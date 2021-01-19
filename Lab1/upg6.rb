require_relative "./upg5"
require "date"

class Person
  def initialize(name = "", surname = "", age = 0)
    @age = age
    @birthyear = Date.today.year - age
    @name = PersonName.new
    @name.set_fullname("#{name} #{surname}")
  end

  attr_reader :age
  attr_reader :birthyear
  attr_reader :name

  def set_birthyear(by)
    @birthyear = by
    @age = Date.today.year - by
  end

  def set_age(age)
    @age = age
    @birthyear = Date.today.year - age
  end
end

p = Person.new("Gustav", "Eriksson", 24)
puts p.birthyear
