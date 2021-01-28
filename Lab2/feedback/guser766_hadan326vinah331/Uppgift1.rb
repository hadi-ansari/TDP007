#1a

#Svårt att hänga med i funktionen, eftersom man delar upp i olika listor och
#matchar index. Hade varit bättre med ett regexuttryck med alla grupper, eller
#åtminstone
def least_goal_diff(league_table)
  team_name = /\d{1,2}.\s{1}([a-zA-Z_]+)/
  # + istället för {1,2}

  difference_pattern = /(\d{1,3})\s{2}-\s{1,2}(\d{1,3})/
  #Hade inte behövt 2 regex-uttryck. Låt namnet vara första gruppen
  team_list = league_table.scan(team_name)
  f_a_list = league_table.scan(difference_pattern)
  diff_list = []
  #f_a_list = [[f, a], [f, a], ...]
  f_a_list.each do | value | diff_list << (value[0].to_i - value[1].to_i).abs()
  end
  least_diff = diff_list.each_with_index.min()
  #each_with_index = fet funktion, som each men man har även en index counter
  #returnerar lista med [värde, index]
  return team_list[least_diff[1]][0]
  #returnerar team_list[index för least_diff][matchdata grupp 0, dvs namnet]
end

#Olika tolkningar av skillnad, först abs och här värde
#Hade varit lättare att kombinera funktionerna om man värderade på samma sätt
def goal_diff_table(league_table)
  #kodupprepning
  team_name = /\d{1,2}.\s{1}([a-zA-Z_]+)/
  difference_pattern = /(\d{1,3})\s{2}-\s{1,2}(\d{1,3})/
  team_list = league_table.scan(team_name)
  f_a_list = league_table.scan(difference_pattern)
  diff_list = []

  f_a_list.each_with_index do | value, index | diff_list << [(value[0].to_i - value[1].to_i), index]
  end
  diff_list = diff_list.sort_by {| diff | diff[0]}.reverse()

  result = ""
  diff_list.each do | element | result << "#{(team_list[element[1]][0])}\n"
  end
  return result
end

#1b
#Här har man bara ett pattern, bra!
def lowest_temp_diff(temp_table)
  pattern = /^\s*(\d{1,2})\s+(\d{1,3})\s+(\d{1,3})/
  #Regex hanterar inte * på dag 26
  stats = temp_table.scan(pattern)
  diff_list = []

  stats.each do | e | diff_list << [e[0], e[1].to_i() - e[2].to_i()]
  end

  min_diff = diff_list.min_by {| e | e[1]}

  return min_diff[0]
end

def diff_list_table(temp_table)
  pattern = /^\s*(\d{1,2})\s+(\d{1,3})\s+(\d{1,3})/
  stats = temp_table.scan(pattern)
  diff_list = []

  stats.each do | e | diff_list << [e[0], e[1].to_i() - e[2].to_i()]
  end

  diff_table = diff_list.min_by(diff_list.length()) {| e | e[1]}

  result = ""
  diff_table.each do | element | result << "#{element[0]},"
  end

  return result
end
