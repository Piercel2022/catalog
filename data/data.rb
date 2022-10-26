require 'json'
require_relative '../classes/source'
require_relative '../classes/movie'
require_relative '../classes/music_album'
require_relative '../classes/genre'

class Data
  def initialize
    @movies = JSON.parse(File.read('data/movies.json'))
    @sources = JSON.parse(File.read('data/sources.json'))
    @albums = JSON.parse(File.read('data/albums.json'))
    @genres = JSON.parse(File.read('data/genres.json'))
  end

  # movies----------------------------------------------------------
  def add_source(movie)
    print 'OOPS Catlog# '
    print 'Source Name: '
    name = gets.chomp

    source = Source.new(name)
    movie.add_source(source)
  end

  def add_movie
    print 'OOPS Catlog# '
    print 'Publish date: '

    print 'Is the movie silent (Y or N): '
    silent = gets.chomp.upcase

    case silent
    when 'Y'
      silent = true
    when 'N'
      silent = false
    else
      puts 'OOPS Library# Please enter a valid input'
      add_source
    end
    print 'Date published: '
    date_published = gets.chomp

    movie = Movie.new(date_published, silent)

    add_source(movie)

    store_movie(movie)
  end

  def store_movie(movie)
    source_obj = {
      name: movie.source.name
    }

    movie_obj = {
      silent: movie.silent,
      date_published: movie.date_published.to_s,
      source: source_obj
    }

    # push it to the movie json obj
    @movies << movie_obj
    @sources << source_obj
    # override
    File.write('data/movies.json', JSON.generate(@movies))
    File.write('data/sources.json', JSON.generate(@sources))

    @movies = JSON.parse(File.read('data/movies.json'))
    @sources = JSON.parse(File.read('data/sources.json'))
  end

  def show_movies
    puts "\n"
    @movies.each_with_index do |movie, i|
      print 'OOPS Catlog# '
      puts "#{i + 1} ->"
      puts "Date published: #{movie['date_published']} "
      puts "is Silent?: #{movie['silent']} "
      puts "Source: #{movie['source']['name']}"
      puts "\n"
    end
  end

  def show_sources
    puts "\n"
    @sources.each_with_index do |source, i|
      print 'OOPS Catlog# '
      print "#{i + 1}-> "
      puts "source: #{source['name']}"
      puts "\n"
    end
  end
  # movies--------------------------------------------------------------------------

  # albums----------------------------------------------------------------
  def add_genre(album)
    print 'OOPS Catlog# '
    print 'Genre Name: '
    name = gets.chomp

    genre = Genre.new(name)
    album.add_genre(genre)
  end

  def add_album
    print 'OOPS Catlog# '

    print 'OOPS Catlog# '
    print 'Available on spotify (Y or N): '
    on_spotify = gets.chomp.upcase

    case on_spotify
    when 'Y'
      on_spotify = true
    when 'N'
      on_spotify = false
    else
      puts 'OOPS Library# Please enter a valid input'
      add_album
    end

    print 'OOPS Catlog# '
    print 'Publish date: '
    date_published = gets.chomp
    album = MusicAlbum.new(on_spotify, date_published)

    add_genre(album)
    store_album(album)
  end

  def store_album(album)
    genre_obj = {
      name: album.genre.name
    }

    album_obj = {
      on_spotify: album.on_spotify,
      date_published: album.date_published.to_s,
      genre: genre_obj
    }

    # push it to the book json obj
    @albums << album_obj
    @genres << genre_obj
    # override
    File.write('data/albums.json', JSON.generate(@albums))
    File.write('data/genres.json', JSON.generate(@genres))

    @albums = JSON.parse(File.read('data/albums.json'))
    @genres = JSON.parse(File.read('data/genres.json'))
  end

  def show_genres
    puts "\n"
    @genres.each_with_index do |genre, i|
      print 'OOPS Catlog# '
      print "#{i + 1}-> "
      puts "Genre: #{genre['name']}"
      puts "\n"
    end
  end

  def show_albums
    puts "\n"
    @albums.each_with_index do |album, i|
      print 'OOPS Catlog# '
      puts "#{i + 1} ->"
      puts "Available on spotify: #{album['on_spotify']}"
      puts "Date Published: #{album['date_published']}"
      puts "Genre: #{album['genre']['name']}"
      puts "\n"
    end
  end
  # albums----------------------------------------------------------------
end
