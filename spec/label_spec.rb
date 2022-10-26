require_relative '../label'
require_relative '../book'

describe Label do
  before(:each) do
    @label = Label.new('48 Laws of Power', 'Red')
    @book = Book.new('2022-10-10', 'Longhorn', 'bad')
  end

  context 'the class Label and its components work correctly' do
    it 'the Label object is created when Label class is instantiated' do
      expect @label.should be_an_instance_of Label
    end

    it 'the Label class initializes with the right variables' do
      expect @label.title.should eq('48 Laws of Power')
      expect @label.color.should eq('Red')
    end

    it 'the add_item method in Label class works correctly' do
      items = @label.add_item(@book)
      expect(items[0]).to be @book
    end
  end
end
