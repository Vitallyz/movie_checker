
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

    def get_movies
        movie_list = []
        get_page.css("div.movie-thumb-wrapper").each_with_index do |element, index| 
            movie_list << [element.css("div.title").text, @@BASE_URL + element.css("a")[0]["href"]]
            # puts "#{index}: #{movie_list.last[0]}, URL: #{movie_list.last[1]}"
        end

        Movie.create_movies_from_array(movie_list)
    end

    def get_movie_props(movie)
        puts "Getting data for movie #{movie.title}"

        browser = Watir::Browser.new :chrome, headless: true
        browser.goto(movie.url)
        props_doc = Nokogiri::HTML(browser.html)
    end

    def get_movie_details(movie)
        if movie.description != ""
            return #the movie data is already retreaved.
        end
        props_doc = get_movie_props(movie)
        props = {}
        props[:title] = movie.title
        props[:url] = movie.url 


        props[:rating] = props_doc.css("div.info")[0].css("span.rating").text
        props[:policy] = props_doc.css("div.info")[0].css("div.policy").text.strip
        props[:description] = props_doc.css("div.info")[0].css("div.description").text.strip
        
        p props[:fb_shares] = props_doc.css("div.info span._5n6h")[1]

        binding.pry

        parse_movie_properties(props_doc.css("div.info")[0].css("div.prop"), props)
        
        Movie.create_or_update_with_props(props)
    end

    def parse_movie_properties( props_doc, props)
        props_doc.each do |prop|
            prop_name = prop.css("span").text

            case (prop_name)
            when "Release Date:"
                props[:release_date] = prop.css("p").text
            when "Running Time:"
                props[:running_time] = prop.css("p").text
            when "Director"
                props[:director] = prop.css("p").text
            when "Cast:"
                props[:cast] = prop.css("p").text
            end
        end
    end
end




