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
