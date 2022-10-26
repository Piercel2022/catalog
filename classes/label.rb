class Label
  attr_accessor :title, :color, :items

  def initialize(title, color)
    @id = Random.rand(1..10_000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item = Item.new)
    @items.push(item)
  end
end