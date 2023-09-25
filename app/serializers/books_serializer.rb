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
          #isbn wasn't a listed attribute for some books (eg 4,5) so a or nil category was added. A clause statement could be added like the ones below
          #if b[isbn] == nil => "oclc": b[:oclc]
          #|| b[:oclc] if the frontend wanted a different idenifier to find books,but would be messy for 
          "isbn":  b[:isbn], 
          "title": b[:title],
        }
      end
    }
  }
}
  end
end