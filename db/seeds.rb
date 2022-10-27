require 'json'

author = Author.find_or_create_by(first_name: 'J.R.R.', last_name: 'Tolkien')
store = Store.find_or_create_by(name: 'Tolkien Heads')

author.books.find_or_create_by(title: 'The Hobbit', year: 1937)
author.books.find_or_create_by(title: 'Lord of the Rings: The Fellowship of the Ring', year: 1954)
author.books.find_or_create_by(title: 'Lord of the Rings: The Two Towers', year: 1954)
author.books.find_or_create_by(title: 'Lord of the Rings: The Return of the King', year: 1955)
author.books.find_or_create_by(title: 'The Silmarillion', year: 1977)

author.books.each do |book|
  store.store_books.create(book: book, count: rand(0..10))
end

author = Author.find_or_create_by(first_name: 'J.K.', last_name: 'Rowling')
store = Store.find_or_create_by(name: 'Potter Heads')

author.books.find_or_create_by(title: "Harry Potter and the Philosopher's Stone", year: 1997)
author.books.find_or_create_by(title: "Harry Potter and the Chamber of Secrets", year: 1998)
author.books.find_or_create_by(title: "Harry Potter and the Prisoner of Azkaban", year: 1999)
author.books.find_or_create_by(title: "Harry Potter and the Goblet of Fire", year: 2000)
author.books.find_or_create_by(title: "Harry Potter and the Order of the Phoenix", year: 2003)
author.books.find_or_create_by(title: "Harry Potter and the Half-Blood Prince", year: 2005)
author.books.find_or_create_by(title: "Harry Potter and the Deathly Hallows", year: 2007)

author.books.each do |book|
  store.store_books.create(book: book, count: rand(0..10))
end

store = Store.find_or_create_by(name: "Nancy's 90s")

file = File.read('./wiki_book_bestsellers.json')
JSON.parse(file).each do |year, books|
  puts year
  books.each do |book|
    first_name = book['author']['firstName']
    last_name = book['author']['lastName']
    author = Author.find_or_create_by(first_name: first_name, last_name: last_name)

    book = author.books.find_or_create_by(title: book['title'])

    if book.year == 1970
      book.update(year: year.to_i)
    end

    store.store_books.create(book: book, count: rand(0..20))
  end
end
