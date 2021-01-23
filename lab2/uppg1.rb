def football_report(file)
  file = File.new(file)
  data_hash = Hash.new
  for line in file
    if line =~ /\s+\d+\./
      stats = line[(/[A-Z]/ =~ line)..-1].split(" ")
      goal_difference = stats[5].to_i - stats[7].to_i
      data_hash[stats[0]] = goal_difference
    end
  end
  data_hash = data_hash.sort_by{|_key, value| value.abs}
  puts "Least GD (goal difference): " + data_hash[0][0] + ", " + data_hash[0][1].to_s + "\n\n"
  puts "Goal difference ranking (F - A)"
  30.times {print "="}
  puts ""
  data_hash = data_hash.sort_by(&:last).reverse
  for pair in data_hash
    puts "#{pair[0]}" + ", " + "#{pair[1]}"
  end
end
football_report("football.txt")
