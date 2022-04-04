Gem::Specification.new do |s|
    s.name        = 'movie_checker'
    s.version     = '1.0.1'
    s.executables << 'movie_checker'
    s.summary     = "Now Showing Movies in AU"
    s.description = "A simple app to show current moviews that are being sceened in AU and request details for the selected movie"
    s.authors     = ["Vitally Xilber"]
    s.email       = 'orgsys@gmail.com'
    # s.files       = [
    #                 "lib/cli.rb",
    #                 "lib/movie.rb",
    #                 "lib/scraper.rb",
    #                 "config/environment.rb",
    #                 "lib/movie_checker.rb"
    #                 ]
    s.files         = `git ls-files`.split("\n")
    s.homepage    =
      'https://github.com/Vitallyz/movie_checker'
    s.license       = 'MIT'
  end