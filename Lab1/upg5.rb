class PersonName
  def initialize()
    @name = ""
    @surname = ""
  end

  def get_fullname()
    "#{@surname} #{@name}"
  end
  
  def set_fullname(str)
    k = str.split(" ")
    @name = k[0]
    @surname = k[1]
  end
  
  
end

p1 = PersonName.new()

p1.set_fullname("Hadi Ansari")
puts p1.get_fullname
