require_relative './item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :publish_date

  def initialize(multiplayer, last_played_at, publish_date, id = Random.rand(1..1000))
    super(publish_date, id)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
    move_to_archive
  end

  def can_be_archived?
    (Date.today.to_time.year - @last_played_at.to_time.year > 2) && super
  end
end
