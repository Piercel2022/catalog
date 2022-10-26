require_relative('../classes/label')
require_relative('../classes/book')

describe Label do
  label = Label.new('Gift', 'blue')
  book = Book.new('22-02-2022', 'RK Publishing House', 'good')
  book.add_label(label)

  it 'initializes with all variables' do
    expect(label.title).to eq 'Gift'
    expect(label.color).to eq 'blue'
  end

  it 'stores an item in its items' do
    items = label.items
    expect(items[0]).to be book
  end

  it 'sets self as label attribute for added item' do
    label_of_book = book.label
    expect(label_of_book).to be label
  end
end
