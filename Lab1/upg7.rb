class Integer
  def fib
    if self == 2
      1
    elsif self == 1
      1
    else
      (self-1).fib + (self-2).fib
    end
  end
end
