require_relative('../classes/book')

describe Book do
  context 'When testing the Book class' do
    book = Book.new('22-02-2022', 'RK Publishing House', 'good')
    book2 = Book.new('22-02-2008', 'RK Publishing House', 'good')
    book3 = Book.new('22-02-2020', 'RK Publishing House', 'bad')

    it 'initializes with all variables' do
      expect(book.date_published).to eq Date.parse('22-02-2022')
    end

    it 'sets the archived false while date > 10 years ago and cover state = good' do
      expect(book.archived).to eq(false)
    end

    it 'sets the archived true while date > 10 years ago and cover state = good' do
      expect(book2.archived).to eq(true)
    end

    it 'sets the archived true while date < 10 years ago and cover state = bad' do
      expect(book3.archived).to eq(true)
    end
  end
end
