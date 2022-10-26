require_relative './item'
class Book < Item
  def initialize(date_published, publisher, cover_state, id = Random.rand(1..1000))
    super(date_published, id)
    @publisher = publisher
    @cover_state = cover_state
    move_to_archive
  end

  def can_be_archived?
    super || cover_state == 'bad'
  end

  attr_accessor :publisher, :cover_state
end
