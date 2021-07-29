class Library
  attr_reader :name,
              :books,
              :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author)
    @authors << author
    add_to_books(author)
  end

  def add_to_books(author)
    author.books.flat_map do |book|
      @books << book
    end
  end

  def publication_time_frame_for(author)
    time_frame_hash = {}
    time_frame_hash[:start] = author.earliest_book.publication_year
    time_frame_hash[:end] = author.latest_book.publication_year
    time_frame_hash
  end
end
