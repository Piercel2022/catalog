require_relative './app'
# 04 Create a main.rb file that will serve as your console app entry-point.
# 05 Implement startup actions:
def main_menu
  # Present the user with a list of options to perform.
  print 'OOPS Catlog# '
  puts "Please choose an option by entering a number: \n
	 1 - List all books'
	 2 - List all music albums'
	 3 - List of games'
	 4 - List all genres (Comedy or Thriller)'
	 5 - List all labels (Gift or New Gift)'
	 6 - List all authors'
	 7 - Add a game'
	 8 - Add a book'
	 9 - Add a music album'
	 10 - Add a movie
	 11 - List all Movies
	 12 - List all Sources
	 0 - Quit the app"
  print 'OOPS Catlog# '

  # Let users choose an option
  gets.to_i
end

def main(app = App.new)
  input = main_menu
  if input.positive? && input < 13
    # If needed, ask for parameters for the option.
    app.process(input)
    main(app)
  elsif input.zero?
    # Have a way to quit the app.
    print 'OOPS Catlog# '
    puts 'Quitted program'
  else
    print 'OOPS Catlog# '
    puts 'Please enter a valid input'
    main(app)
  end
end

# app started
main
