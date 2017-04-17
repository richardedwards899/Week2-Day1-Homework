require('minitest/autorun')
require('minitest/rg')
require_relative('../student.rb')

#Part A...

class TestClasses < MiniTest::Test

  def setup
    @student1 = Student.new("Richard", 12)
    @student2 = Student.new("Greg", 11)

    @players = [
      "Tom Shaftsbury", "Lizzie Smith", "Gerald Humperdink"
    ]
    @team1 = SportsTeam.new("Timid Tigers", "Bob Swanston", @players)
  end

  def test_get_name
    expected = "Richard"
    actual = @student1.get_name

    assert_equal(expected, actual)
  end

  def test_get_name_2
    expected = "Greg"
    actual = @student2.get_name

    assert_equal(expected, actual)
  end

  def test_get_cohort
    expected = 12
    actual = @student1.get_cohort

    assert_equal(expected, actual)
  end

  def test_get_cohort
    expected = 11
    actual = @student2.get_cohort

    assert_equal(expected, actual)
  end

  def test_set_name
    @student2.set_name("Robert")

    assert_equal("Robert", @student2.get_name)
  end

  def test_set_cohort
    @student2.set_cohort(13)

    assert_equal(13, @student2.get_cohort)
  end

  def test_talk
    assert_equal("I can talk!", @student1.talk)
  end

  def test_favourite_language
    assert_equal("I love Ruby!", @student1.declare_language_love("Ruby"))
  end

  def test_favourite_language_2
    assert_equal("I love Java!", @student1.declare_language_love("Java"))
  end

  ## Part B...
  def test_add_player
    expected = ["Tom Shaftsbury", "Lizzie Smith", "Gerald Humperdink", "Phill Gillespie"]
    actual = @team1.add_player("Phill Gillespie")

    assert_equal(expected, actual)
  end

  def test_add_player_2
    expected = ["Tom Shaftsbury", "Lizzie Smith", "Gerald Humperdink", "Barry Lovern"]
    actual = @team1.add_player("Barry Lovern")

    assert_equal(expected, actual)
  end

  def test_has_player?
    assert_equal(true, @team1.has_player?("Lizzie Smith"))
  end

  def test_has_player?
    assert_equal(false, @team1.has_player?("Maggie Thornton"))
  end

  def test_update_points_on_win
    assert_equal(5, @team1.update_score("win"))
  end

  def test_update_points_on_lose
    assert_equal(0, @team1.update_score("lose"))
  end

end