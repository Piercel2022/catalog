require_relative '../book'
require_relative '../label'
require 'json'

class Data
  def initialize
    @books = []
    @labels = []
  end

  # method to create a book item
  def add_book
    print 'date_published: '
    date = gets.chomp

    print 'publisher: '
    publisher = gets.chomp

    print 'cover_state (good or bad): '
    state = gets.chomp

    book = Book.new(date, publisher, state)

    add_label(book)
    save_book(book)
  end

  # method to add label
  def add_label(item)
    print 'Label title: '
    title = gets.chomp

    print 'Label color: '
    color = gets.chomp

    label = Label.new(title, color)
    item.add_label(label)
  end

  # method to save book
  def save_book(book)
    label_obj = {
      title: book.label.title,
      color: book.label.color
    }
    book_obj = {
      publisher: book.publisher,
      cover_state: book.cover_state,
      date_published: book.date_published,
      book_label: label_obj
    }

    @books << book_obj
    @labels << label_obj

    File.write('./data/books_save.json', JSON.generate(@books))
    File.write('./data/labels_save.json', JSON.generate(@labels))
  end
end
