require('minitest/autorun')
require('minitest/rg')
require_relative('../Library.rb')

class TestLibrary < MiniTest::Test

  def setup

    @book1 = { 
      title: "lord_of_the_rings",
      rental_details: { 
        student_name: "Jeff", 
        date: "01/06/17"
      }
    }
    @book2 = { 
      title: "of_mice_and_men",
      rental_details: { 
        student_name: "George", 
        date: "07/05/17"
      }
    }
    @book3 = { 
      title: "crime_and_punishment",
      rental_details: { 
        student_name: "Rupert", 
        date: "31/05/17"
      }
    }
    @library = Library.new([@book1, @book2, @book3])
  end

  def test_library_creation
    expected = true
    actual = @library.instance_of? Library

    assert_equal(expected, actual)
  end

  def test_list_all_books
    expected = "lord_of_the_rings, Jeff, 01/06/17\n"+
                "of_mice_and_men, George, 07/05/17\n"+
                "crime_and_punishment, Rupert, 31/05/17\n"
    actual = @library.list_all_books()

    assert_equal(expected, actual)
  end

  def test_search_on_title__all_details
    expected = "of_mice_and_men, George, 07/05/17\n"
    actual = @library.search_on_title("of_mice_and_men")

    assert_equal(expected, actual)
  end
  
  def test_search_on_title__renter_details
    expected = "George, 07/05/17\n"
    actual = @library.renter_details("of_mice_and_men")

    assert_equal(expected, actual)
  end

  def test_add_book
    @library.add_book("bird_song")

    expected = "lord_of_the_rings, Jeff, 01/06/17\n"+
                "of_mice_and_men, George, 07/05/17\n"+
                "crime_and_punishment, Rupert, 31/05/17\n"+
                "bird_song, , \n"
    actual = @library.list_all_books

    assert_equal(expected, actual)
  end

  def test_change_loan_details
    @library.change_loan_details("of_mice_and_men", "Richard", "31/05/17")

    expected = "lord_of_the_rings, Jeff, 01/06/17\n"+
                "of_mice_and_men, Richard, 31/05/17\n"+
                "crime_and_punishment, Rupert, 31/05/17\n"
    actual = @library.list_all_books
 
    assert_equal(expected, actual)
  end

end