class Scraper 

    def get_page(url)

        doc = Nokogiri::HTML(URI.open(url))

        binding.pry
    end
end




