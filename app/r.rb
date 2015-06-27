h = { "a" => 1, "c" => 3, "b" => 2  }
h.each_with_index {|hours,i| puts "#{i+1}. #{hours}" }.sort{|a,b| b<=>a}

# ho = Hour.find(:all).index_by{|hours| "#{hour.user_id} #{hour.hours.goukei } "}
# hou = ho.each_with_index {|hours,i| puts "#{i+1}. #{hours}" }.sort{|a,b| b<=>a}

# users = User.all.index_by{|user| "#{user.id} #{ user.sum_by_a_week } "}
h = { "a" => 1, "c" => 3, "b" => 2  }
# users.each_with_index{|u,i|  }