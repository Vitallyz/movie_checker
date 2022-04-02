# movie_check

# This app lists current movies being screened in the Australian cinemas. You can select a movie from the list and see some details like release date, description etc. 

To get this app working you need to add to your path location of the chromedriver(driver is in the porject):

export PATH=$PATH:<yourpath>/chromedriver/

The website is unable to be scraped using open-uri gem

The app grabs a list of movies from:
https://www.eventcinemas.com.au/Movies/NowShowing#sortby=popularity

By selecting a movie from the list the app will grab movie's details. 

The app will not attempt to scrap information it already did using previouse requests
