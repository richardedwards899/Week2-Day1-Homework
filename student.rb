class Student

  def initialize(student_name, cohort_number)
    @name = student_name
    @cohort = cohort_number
  end

  def get_name
    return @name
  end

  def get_cohort
    return @cohort
  end

  def set_name(new_name)
    @name = new_name
  end

  def set_cohort(new_cohort)
    @cohort = new_cohort
  end

  def talk
    return "I can talk!"
  end

  def declare_language_love(language_of_love)
    return "I love #{language_of_love}!" 
  end

end

class SportsTeam

  attr_accessor :team_name, :coach_name, :players, :points

  def initialize(team_name, coach_name, player_array)
    @team_name = team_name
    @coach_name = coach_name
    @players = player_array
    @points = 0 
  end

  def add_player(new_player)
    return @players.push(new_player)
  end

  def has_player?(player_name)
    return true if @players.include?(player_name)
    return false
  end

  def update_score(match_result)
    @points += 5 if match_result == "win"
    return @points 
  end

end