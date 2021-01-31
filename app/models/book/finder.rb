class Book::Finder
  attr_reader :sufficients, :insufficients

  def initialize(query_constructor)
    @query_constructor = query_constructor
    @sufficients = create_sufficients
    @insufficients = create_insufficients
  end

  def create_sufficients
    Book.book_search(@query_constructor.sufficient_query)
  end
  
  def create_insufficients
    Book.where.not(id: @sufficients.pluck(:id)).book_search(@query_constructor.insufficient_query)
  end
end