require_relative '../book'

describe Book do
  before(:each) do
    @book = Book.new(:publisher, :cover_state)
  end

  context 'the class Book and its components work correctly' do
    it 'the Book object is created when Book class is instantiated' do
      expect @book.should be_an_instance_of Book
    end

    it 'the Book class has the correct attributes' do
      book = @book.new('Longhorn', 'covered')
      expect book.should have_attributes('Longhorn')
    end
  end
end
