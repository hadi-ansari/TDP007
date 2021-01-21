#u5
#From what we have seen you use PascalCase for classes but snake_case for methods/functions
class PersonName
  #inconsequent to initialize with (n, sn) but call functions with fullname
  #Maybe take fullname as parameter here and call setFullName
  def initialize(n, sn)
    @name = n
    @surname = sn
  end

  #Can be written def fullname() which can then be accessed with .fullname
  def getFullName()
    return "#{@name} #{@surname}"
  end

  #Can be written def fullname=() which can then be accessed with .fullname = string
  def setFullName(fullname)
    @name = fullname.split(" ")[0] #better to save a variable and call [0] and [1]?
    @surname = fullname.split(" ")[1]
  end
end

#6
class Person
  def initialize(name, surname, age)
    @name = PersonName.new(name, surname)
    setAge(age)
  end

  def setAge(age) #def age=(rhs)
    @age = age
    @birthyear = Time.now().year() - age #Did you not have to require the library?
  end

  def setBirthyear(birthyear) #def birthyear=(rhs)
    @birthyear = birthyear
    @age = Time.now().year() - @birthyear
  end

  def getAge() #Could have used attr_reader
    return @age
  end

  def getBirthyear() #Could have used attr_reader
    return @birthyear
  end
end
