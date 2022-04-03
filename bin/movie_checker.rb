require_relative '../config/environment'

class MovieChecker

  attr_accessor :cli, :scraper

  def initialize
    self.cli = CLI.new
    self.cli.clear_screen
    cli.print_message "Getting data from the server"
    self.scraper = Scraper.new
  end


  def start
    loop do
      print_movies
      input = select_movie
      movie = Movie.all[input - 1]
      cli.clear_screen
      cli.print_message "Getting data for the movie: #{movie.title}"
      scraper.get_movie_details(movie)
      print_movie_details(movie)

      input = cli.get_input_with_message 'Type "q" to quit or anything else to start over'
      check_for_program_exit_request(input)
    end
  end

  def select_movie
    input =""
    
    loop do
      input = (cli.get_input_with_message 'Enter the movie number to get more info. Type "e" to quit the program')
      break if movie_exist?(input)
    end
    input.to_i
  end


  def print_movies
    self.cli.clear_screen
    cli.print_message 'List of all movies currenty showing in Australia:'
    Movie.all.each.with_index(1) { |movie, index| cli.print_message("#{index}: #{movie.title}") }
  end

  def print_movie_details (movie)
    cli.print_message "Title: #{movie.title}" if movie.title
    cli.print_message "Rating: #{movie.rating}" if movie.rating
    cli.print_message "Policy: #{movie.policy}" if movie.policy
    cli.print_message "Release Date: #{movie.release_date}" if movie.release_date
    cli.print_message "Running Time: #{movie.running_time}" if movie.running_time
    cli.print_message "Director: #{movie.director}" if movie.director
    cli.print_message "Cast: #{movie.cast}" if movie.cast
    cli.print_message "Description: #{movie.description}" if movie.description
    end

  def movie_exist?(input)
    check_for_program_exit_request(input)
    input = input.to_i
    if input == !nil || input < 1 || input > Movie.all.count
      cli.print_message 'You have entered invalid movie number'
      false
    else
      true
    end
  end

  def check_for_program_exit_request(input)
    input = input.chomp
    if input.upcase == "EXIT" || input.upcase == "E" || input.upcase == "QUIT" || input.upcase == "Q"
      cli.print_message "Exiting as per user request ..."
      exit
    end
  end
end

app = MovieChecker.new

app.start
