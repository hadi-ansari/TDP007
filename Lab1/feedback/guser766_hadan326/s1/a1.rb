#u1
def n_times(n, &block)
  for i in 1..n
    block.call()
  end
end

class Repeat
  def initialize(n)
    @number = n
  end

  def each(&block)
    #Could have used n_times here
    #Or is that an unnecessary dependency?
    for i in 1..@number
      block.call()
    end
  end
end

# notes:
#... exklusiv .. inklusiv

#u2
#factorial (-7) for example should not work
#but it is good that it handles 0! = 1
#inject was a prerequsit here, but could also use
#(1..n).reduce(:*) which just multiply everything in the range
def factorial(n)
  #if n<= 1 then return 1 else return [...]
  return n <= 1 ? 1 : (1..n).inject { |sum, number| sum * number }
end

#u3

def longest_string(list)
  return list.sort_by { |e| -e.length }[0] #smart use of - here but a bit confusing
  #perhaps more clear to return last index [-1]
end
