class Label
  def initialize(title, color, id = Random.rand(1..1000))
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
  end

  attr_reader :id, :title, :color, :items
end
