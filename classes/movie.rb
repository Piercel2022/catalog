require_relative './item'

class Movie < Item
  def initialize(date_published, silent, id = Random.rand(1..1000))
    super(date_published, id)
    @silent = silent
    move_to_archive
  end

  def can_be_archived?
    super || @silent
  end

  attr_accessor :silent
end
