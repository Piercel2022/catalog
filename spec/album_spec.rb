require 'date'
require_relative '../classes/music_album'
require_relative '../classes/item'

describe MusicAlbum do
  context 'test music album' do
    let(:music_album) { MusicAlbum.new(true, '2010-01-01') }

    it 'should return instance of MusicAlbum' do
      expect(music_album).to be_an_instance_of MusicAlbum
    end

    it 'should be able to move to archive since on_spotify is true and publish_date is more than 10 years old' do
      music_album.move_to_archive
      expect(music_album.archived).to be true
    end
  end
end
