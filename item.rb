require 'date'

class Item
  attr_accessor :date_published
  attr_reader :id, :archived, :genre, :author, :label

  def initialize(date_published, id)
    @date_published = Date.parse(date_published)
    @archived = false
    @id = id
  end

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

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def can_be_archived?
    true if (Date.today.to_time.year - @date_published.to_time.year) > 10
  end
end
