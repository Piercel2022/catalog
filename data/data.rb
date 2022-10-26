require_relative '../classes/book'
require_relative '../classes/label'
require 'json'

class Data
  def initialize
    @books = JSON.parse(File.read('data/books_save.json'))
    @labels = JSON.parse(File.read('data/labels_save.json'))
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

    File.write('data/books_save.json', JSON.generate(@books))
    File.write('data/labels_save.json', JSON.generate(@labels))

    # update current state for books and labels
    @books = JSON.parse(File.read('data/books_save.json'))
    @labels = JSON.parse(File.read('data/labels_save.json'))
  end

  #   method to display books
  def show_books
    puts "\n"
    @books.each_with_index do |book, idx|
      print 'OOPS Catlog#'
      puts "#{idx + 1} ->"
      puts "Publisher: #{book['publisher']}"
      puts "Cover_state: #{book['cover_state']}"
      puts "Date Published: #{book['date_published']}"
      puts "Label: #{book['book_label']['title']}"
      puts "Color: #{book['book_label']['color']}"
      puts "\n"
    end
  end

  # method to display labels
  def show_labels
    puts "\n"
    @labels.each_with_index do |label, idx|
      print 'OOPS Catlog#'
      puts "#{idx + 1}: Title: #{label['title']} - Color: #{label['color']}"
      puts "\n"
    end
  end
end
