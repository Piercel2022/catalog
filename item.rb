require 'date'

class Item
  def initialize(date_published, id)
    @date_published = Date.parse(date_published)
    @archived = false
    @id = id
  end
end
