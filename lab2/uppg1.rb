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

def weather_report(file)
  file = File.new(file)
  data_array = Array.new
  for line in file
    if line =~ /\d+ /
      data = line.split(" ")
      data[0].class
      if data[0] == "mo"
        break
      else
        data_hash = Hash.new
        data_hash["day"] = data[0]
        data_hash["MxT"] = data[1]
        data_hash["MnT"] = data[2]
        data_array << data_hash
      end
    end
  end
  #takes out the day (hash) with the smallest temp diff
  least_diff = data_array.min { |a, b| (a["MxT"].to_i - a["MnT"].to_i).abs <=> (b["MxT"].to_i - b["MnT"].to_i).abs}
  #prints day(int) and diff
  puts "The day with the least temperature difference was the #{least_diff["day"]}#{suffix_check(least_diff["day"])} with a difference of #{(least_diff["MxT"].to_i-least_diff["MnT"].to_i).abs} degrees.\n\n"
  #sorts month based on temp diff
  data_array = data_array.sort { |a, b| (a["MxT"].to_i - a["MnT"].to_i) <=> (b["MxT"].to_i - b["MnT"].to_i)}

  puts "Daily temperature difference ranking (MxT - MnT)\n#{"="* "Daily temperature difference ranking (MxT - MnT)".length}"
  #prints month
  puts data_array.collect { |a| "#{a["day"]}#{suffix_check(a["day"])}: #{(a["MxT"].to_i - a["MnT"].to_i)} degrees" }
end

def suffix_check(int)
  if int == "1"
    suffix = "st"
  elsif int == "2"
    suffix = "nd"
  elsif int == "3"
    suffix = "rd"
  else
    suffix = "th"
end
weather_report("weather.txt")
