class Label
  def initialize(title, color)
    @id = Random.rand(1..10000)
    @title = title
    @color = color
    @items = []
  end
end
