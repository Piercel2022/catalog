require_relative '../classes/movie'

describe Movie do
  before :each do
    @movie = Movie.new('2020-10-11', true)
  end

  it 'should be the instance of class' do
    expect(@movie).to be_instance_of Movie
  end

  it 'check if the Movie can be archived' do
    can_be_archived = @movie.send(:can_be_archived?)
    expect(can_be_archived).to be true
  end
end