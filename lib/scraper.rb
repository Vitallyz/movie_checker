
class Scraper 
    @@URL ="https://www.eventcinemas.com.au/Movies/NowShowing#sortby=popularity"
    @@BASE_URL = "https://www.eventcinemas.com.au/"

    @@doc = nil #store the movie data so that you dont need to get it more than once

    def get_page
        if !@@doc
            browser = Watir::Browser.new :chrome, headless: true
            browser.goto(@@URL)
            @@doc  = Nokogiri::HTML(browser.html)
        end

        doc = @@doc
    end

    def get_movie_list_with_url
        movie_list = []
        get_page.css("div.movie-thumb-wrapper").each_with_index do |element, index| 
            movie_list << [element.css("div.title").text, @@BASE_URL + element.css("a")[0]["href"]]
            # puts "#{index}: #{movie_list.last[0]}, URL: #{movie_list.last[1]}"
        end

        movie_list
    end

    def get_movie_data(movie)
        puts "Getting data for movie #{movie.title}"

        browser = Watir::Browser.new :chrome, headless: true
        browser.goto(movie.url)
        doc = Nokogiri::HTML(browser.html)
    end

    def set_movie_data(movie)
        if movie.description != ""
            return #the movie data is already retreaved.
        end
        doc = get_movie_data(movie)
        movie.rating = doc.css("div.info")[0].css("span.rating").text
        movie.policy = doc.css("div.info")[0].css("div.policy").text.strip
        movie.description = doc.css("div.info")[0].css("div.description").text.strip

        set_movie_properties(doc.css("div.info")[0].css("div.prop"), movie)
    end

    def set_movie_properties( props, movie)
        props.each do |prop|
            prop_name = prop.css("span").text

            case (prop_name)
            when "Release Date:"
                movie.release_date = prop.css("p").text
            when "Running Time:"
                movie.running_time = prop.css("p").text
            when "Director"
                movie.director = prop.css("p").text
            when "Cast:"
                movie.cast = prop.css("p").text
            end
        end
    end
end




