require_relative '../book'

describe Book do
  before(:each) do
    @book = Book.new('2022-10-10', 'Longhorn', 'bad')
    @book1 = Book.new('2022-10-10', 'Longhorn', 'good')
  end

  context 'the class Book and its components work correctly' do
    it 'the Book object is created when Book class is instantiated' do
      expect @book.should be_an_instance_of Book
    end

    it 'the can_be_archived method works correctly' do
      expect @book.can_be_archived?.should be_truthy
    end

    it 'the can_be_archived method works correctly' do
      expect @book1.can_be_archived?.should be_falsey
    end
  end
end
