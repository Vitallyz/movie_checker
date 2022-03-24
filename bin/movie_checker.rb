require_relative '../config/environment.rb'


cli = CLI.new
cli.clear_screen
scraper = Scraper.new

cli.print_message "List of all movies currenty showing in Australia:"

Movie.all.each.with_index(1) {|movie, index| cli.print_message ("#{index}: #{movie.title}")}

input = (cli.get_input_with_message "Enter the movie number to get more info").to_i

if input == !nil || input < 1 || input > Movie.all.count
    cli.print_message "You have entered invalid movie number"
    return
end


movie = Movie.all[input-1]
puts "Getting data for the movie #{movie.title}"
scraper.get_movie_details(movie)
movie

p movie


def print_movie_details(movie)

end