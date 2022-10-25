require_relative '../label'

describe Book do
  before(:each) do
    @label = Label.new(:title, :color)
  end

  context 'the class Label and its components work correctly' do
    it 'the Label object is created when Label class is instantiated' do
      expect @label.should be_an_instance_of Label
    end
  end
end
