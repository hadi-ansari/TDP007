#7
class Integer
  def fib()
    #should negative numbers work?
    #Recursive is a good solution
    return (self <= 1) ? self : (self - 1).fib() + (self - 2).fib()
  end
end

# 8
class String
  def acronym()
    #Split the word.
    #You dont have to use self?
    #Use map to, on every word, change the word into its first letter
    #Join the array together
    #upcase

    #map is very useful

    #perhaps a bit hard to read at first
    #cool with one line, but maybe split up on multiple lines for clarity?
    return split(" ").map { |w| w[0] }.join().upcase()
  end
end
