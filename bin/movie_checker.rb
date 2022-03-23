require_relative '../config/environment.rb'

scraper = Scraper.new
movies_array = scraper.get_movie_list_with_url

Movie.create_movies_from_array(movies_array)
puts "\n\n\nAttempting to get movie list\n\n\n"
# Movie.print_all_movies

movie = Movie.all[0]

scraper.set_movie_data(movie)
movie
puts movie
p movie

movie1 = Movie.all[0]

scraper.set_movie_data(movie1)
movie1
puts movie1
p movie1







