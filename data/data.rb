require 'json'
require_relative '../classes/game'
require_relative '../classes/author'

class Data
  def initialize
    @games = JSON.parse(File.read('data/games.json'))
    @authors = JSON.parse(File.read('data/author.json'))
  end

  def add_author(game)
    print 'OOPS Catlog# '
    print 'First Name: '
    first_name = gets.chomp

    print 'OOPS Catlog# '
    print 'Last Name: '
    last_name = gets.chomp

    author = Author.new(first_name, last_name)
    game.add_author(author)
  end

  def add_game
    print 'OOPS Catlog# '
    print 'OOPS Catlog# '
    print 'Is the game multiplayer(Y or N): '
    multiplayer = gets.chomp.upcase
    case multiplayer
    when 'Y'
      multiplayer = true
    when 'N'
      multiplayer = false
    else
      puts 'OOPS Library# Please enter a valid input'
      add_game
    end
    print 'OOPS Catlog# '
    print 'Last played at (date): '
    last_played_at = gets.chomp

    print 'OOPS Catlog# '
    print 'Publish date: '
    date_published = gets.chomp
    game = Game.new(multiplayer, last_played_at, date_published)

    add_author(game)
    store_game(game)
  end

  def store_game(game)
    author_obj = {
      first_name: game.author.first_name,
      last_name: game.author.last_name
    }

    game_obj = {
      multiplayer: game.multiplayer,
      last_played_at: game.last_played_at,
      date_published: game.date_published.to_s,
      author: author_obj
    }

    # push it to the book json obj
    @games << game_obj
    @authors << author_obj
    # override
    File.write('data/games.json', JSON.generate(@games))
    File.write('data/author.json', JSON.generate(@authors))

    @games = JSON.parse(File.read('data/games.json'))
    @authors = JSON.parse(File.read('data/author.json'))
  end

  def show_games
    puts "\n"
    @games.each_with_index do |game, i|
      print 'OOPS Catlog# '
      puts "#{i + 1} ->"
      puts "Last played on: #{game['last_played_at']}"
      puts "Date Published: #{game['date_published']}"
      puts "Author Name: #{game['author']['first_name']} #{game['author']['last_name']}"
      puts "\n"
    end
  end

  def show_authors
    puts "\n"
    @authors.each_with_index do |author, i|
      print 'OOPS Catlog# '
      puts "#{i + 1} ->"

      puts "First Name: #{author['first_name']}"
      puts "Last Name: #{author['last_name']}"
      puts "\n"
    end
  end
end
