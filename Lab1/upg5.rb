class PersonName
  def initialize()
    @name = ""
    @surname = ""
  end

  def get_fullname()
    "#{@name} #{@surname}"
  end

  def set_fullname(str)
    k = str.split(" ")
    @name = k[0]
    @surname = k[1]
  end
end
