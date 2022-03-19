require_relative '../config/environment.rb'

Scraper.new.get_page("https://mrc.racing.com/calendar#/event-view?month=3&year=2022")
