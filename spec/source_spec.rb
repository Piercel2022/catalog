require_relative '../classes/item'
require_relative '../classes/source'

describe Source do
  before :each do
    @source = Source.new("TV")
  end

  context 'should create a new source' do
    it 'takes one parameters for the author' do
      expect(@source).to be_an_instance_of Source
    end

    it 'should return the source name' do
			name = @source.name
      expect(name).to eq "TV"
    end
  end
end