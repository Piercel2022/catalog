require './item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(date_published, publisher, cover_state, id = Random.rand(1..10000))
    super(date_published, id)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || cover_state == 'bad'
  end
end
