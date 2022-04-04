class Movie
    @@all =[]

    attr_accessor :title, :url, :rating, :policy, :release_date, :running_time, :director, :cast, :description

    def initialize (title:, url:, rating: "", policy: "", release_date: "", running_time: "", director: "", cast: "", description: "")
        @title = title
        @url = url
        @rating = rating
        @policy = policy
        @release_date = release_date
        @running_time = running_time
        @director = director
        @cast = cast
        @description = description

        self.class.all << self
    end

    def self.all 
        @@all
    end

    def is_scraped?
        if @description == ""
            return false
        else
            return true
        end
    end

    def self.create_movies_from_array(array)
        array.each {|movie_init_data| create_or_update_with_props(movie_init_data)}
    end

    def self.create_or_update_with_props(props_hash)
        movie = self.all.find {|movie| movie.title == props_hash[:title]}

        if movie
            movie.update_movie_with_props(props_hash)
        else
            self.new(props_hash)
        end
    end

    def update_movie_with_props(props)
        props.each {|key, value| self.send(("#{key}="), value)}
    end

    def self.print_all_movies
        @@all.each.with_index(1) {|movie, index| puts "#{index}: #{movie.title}, #{movie.url}"}
    end
end