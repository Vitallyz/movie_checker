require_relative '../config/environment.rb'

scraper = Scraper.new
movies_array = scraper.get_movies


puts "\n\n\nAttempting to get movie list\n\n\n"
Movie.print_all_movies

movie = Movie.all[0]
puts "\n\n\nMovie data without props:"
p movie

scraper.get_movie_details(movie)
puts "\n\n\nMovie data with props:"
p movie

movie = Movie.all[21]
puts "\n\n\nMovie data without props:"
p movie

scraper.get_movie_details(movie)
puts "\n\n\nMovie data with props:"
p movie









