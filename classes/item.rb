# 01 Create Item class in a separate .rb file.
require 'date'

class Item
  def initialize(date_published, id)
    @date_published = Date.parse(date_published)
    @archived = false
    @id = id
  end

  # 02
  # Add all methods visible in the diagram.
  def add_author(author)
    @author = author
    author.add_item(self)
  end

  def add_source(source)
    @source = source
    source.add_item(self)
  end

  def add_label(label)
    @label = label
    label.add_item(self)
  end

  def add_genre(genre)
    @genre = genre
    genre.add_item(self)
  end

  # 03 Implement methods:
  # can_be_archived?() in the Item class
  # should return true if published_date is older than 10 years
  # otherwise, it should return false
  def can_be_archived?
    true if (Date.today.to_time.year - @date_published.to_time.year) > 10
  end

  # move_to_archive() in the Item class
  # should reuse can_be_archived?() method
  # should change the archived property to true if the result of the can_be_archived?() method is true
  # should do nothing if the result of the can_be_archived?() method is false
  def move_to_archive
    @archived = true if can_be_archived?
  end

  attr_accessor :date_published
  attr_reader :id, :archived, :genre, :author, :label
end
