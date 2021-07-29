class Author
  attr_reader :first_name,
              :last_name,
              :books

  def initialize(params)
    @first_name = params[:first_name]
    @last_name = params[:last_name]
    @books = []
    @checked_out_books = []
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def write(title, publication_date)
    new_book = Book.new({first_name: @author_first_name, last_name: @author_last_name, title: title, publication_date: publication_date})
    @books << new_book
    new_book
  end

  def earliest_book
    @books.min_by do |book|
      book.publication_year
    end
  end

  def latest_book
    @books.max_by do |book|
      book.publication_year
    end
  end
end
