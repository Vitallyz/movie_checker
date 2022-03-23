
class Movie
    @@all =[]

    attr_accessor :title, :url, :rating, :policy, :release_date, :running_time, :director, :cast, :description, :fb_shares  

    def initialize (title, url, rating = "", policy = "", release_date = "", running_time = "", director = "", cast = "", description = "", fb_shares = nil )
        self.title = title
        self.url = url
        self.release_date = release_date
        self.running_time = running_time
        self. director = director
        self. cast = cast
        self.description = description
        self.fb_shares = fb_shares

        self.class.all << self
    end

    def self.all 
        @@all
    end

    def is_scraped?
        if description == ""
            return false
        else
            return true
        end
    end

    def self.create_movie(title, url)
        self.new(title, url)
    end

    def self.create_movies_from_array(array)
        array.each {|movie| create_movie(movie[0], movie[1])}
    end

    def self.print_all_movies
        @@all.each.with_index(1) {|movie, index| puts "#{index}: #{movie.title}, #{movie.url}"}
    end

end