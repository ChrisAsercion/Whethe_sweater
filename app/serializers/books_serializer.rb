class BooksSerializer
  def self.format_books_and_forecast(forecast, books)
    {
  "data": {
    "id": "null",
    "type": "books",
    "attributes": {
      "destination":  books[:docs][0][:title],
      "forecast": {
        "summary": forecast[:current][:condition][:text],
        "temperature": forecast[:current][:temp_f].to_s + " F"
      },
      "total_books_found": books[:numFound],
      "books": books[:docs].map do |b|
        {
          "isbn":  b[:isbn], #|| b[:oclc] if the user wanted another idenifier
          "title": b[:title],
        }
      end
    }
  }
}
  end
end