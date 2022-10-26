require 'json'
require_relative '../classes/source'
require_relative '../classes/movie'
class Data
  def initialize
    @movies = JSON.parse(File.read('data/movies.json'))
    @sources = JSON.parse(File.read('data/sources.json'))
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
end
