class Library

  def initialize(books_array)
    @books = books_array
  end

  def list_all_books
    result_string = ""

    for book in @books
      result_string += book[:title]+", "
      result_string += book[:rental_details][:student_name]+", "
      result_string += book[:rental_details][:date]+"\n"
    end
    return result_string
  end

  def search_on_title(search_title)
    found_book = ""
    for book in @books
      if book[:title] == search_title
        found_book += book[:title]+", "
        found_book += book[:rental_details][:student_name]+", "
        found_book += book[:rental_details][:date]+"\n"
        return found_book
      end
    end
  end

  def renter_details(title)
    found_book = ""
    for book in @books
      if book[:title] == title
        found_book += book[:rental_details][:student_name]+", "
        found_book += book[:rental_details][:date]+"\n"
        return found_book
      end
    end
  end

  def add_book(title)
    book_to_add = {
      title: title,
      rental_details: { 
        student_name: "", 
        date: ""
      }
    }
    @books.push(book_to_add)
  end

  def change_loan_details(title, person, return_date)
    for book in @books
      if book[:title] == title
        book[:rental_details][:student_name] = person
        book[:rental_details][:date] = return_date
        return nil
      end
    end 
  end

end