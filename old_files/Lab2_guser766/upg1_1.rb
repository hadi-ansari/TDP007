#Named groups seems to only work for match, and you can only access the group
#members for each match with index, when using scan

# def teamlist(str)
#   re = /(?<name>[a-zA-z]+).+\s(?<F>\d+)\s+-\s+(?<A>\d+).+/
#   matches = str.scan(re)
#   for match in matches
#     puts "#{match[:name]} #{match[:F]} #{match[:]}"
#   end
# end

#--Part 1----------------------------------------------------------------------
def teamlist(str)
  team_array = []
  re = /(?<name>[a-zA-z]+).+\s(?<F>\d+)\s+-\s+(?<A>\d+).+/
  matches = str.scan(re)
  for match in matches
    team_array.append({name: match[0], F: match[1].to_i, A: match[2].to_i})
  end
  return team_array
end

def goal_score_sort(team_array)
  return team_array.sort_by {|team| (team[:F] - team[:A]).abs}
end

def least_goal_score_diff(team_array)
  return team_array.min_by {|team| (team[:F] - team[:A]).abs}
end

str = File.new("football.txt")

# for team in teamlist(str)
#   puts "#{team[:name]} #{team[:F]} #{team[:A]}"
# end

sorted = goal_score_sort(teamlist(str))

for team in sorted
  puts "#{team[:name]} #{team[:F]} #{team[:A]}"
end

puts "\n"
least_diff_team = least_goal_score_diff(teamlist(str))
puts "Least diff: #{least_diff_team[:name]} #{least_diff_team[:F]} #{least_diff_team[:A]}"


#--Part 2-------------------------------------------------------------------------------------
