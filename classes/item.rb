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
  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def source=(source)
    @source = source
    source.items.push(self) unless source.items.include?(self)
  end

  # 03 Implement methods:
  # can_be_archived?() in the Item class
  # should return true if published_date is older than 10 years
  # otherwise, it should return false
  def can_be_archived?
    today = Date.today
    ten_years_ago = Date.new(today.year - 10, today.month, today.day)

    @date_published < ten_years_ago
  end

  # move_to_archive() in the Item class
  # should reuse can_be_archived?() method
  # should change the archived property to true if the result of the can_be_archived?() method is true
  # should do nothing if the result of the can_be_archived?() method is false
  def move_to_archive
    @archived = true if can_be_archived?
  end

  attr_accessor :date_published
  attr_reader :id, :archived, :genre, :author, :label, :source
end
