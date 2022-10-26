require_relative '../classes/genre'
require_relative '../classes/music_album'
require_relative '../classes/item'

describe Genre do
  context 'test genre' do
    let(:genre) { Genre.new('Rock') }
    let(:music_album) { MusicAlbum.new(true, '2010-01-01') }

    it 'should return instance of Genre' do
      expect(genre).to be_an_instance_of Genre
    end

    it 'should have the correct attributes' do
      expect(genre).to have_attributes(
        name: 'Rock'
      )
    end

    it 'test add item' do
      music_album.add_genre(genre)
      expect(genre.items[0]).to eq(music_album)
    end
  end
end
