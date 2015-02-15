# movie_search
Create a search that populates 9 movie posters with the search word in the title using IMDB.



MOVIE SEARCH

user types in a search “funny”
funny show movies that contain word (9) - which were filmed/show in 

*use o’clock method from javascript

create search for a “word”
populate 9 movie posters that contain that “word” in the title
filter out movies that do not have a poster image
show message if 9 movies cannot be found
create a quiz question about the movies

IMBD gem docs
search = Imdb::Search.new(“mr.deeds”)
ap search.movies.class
ap search.movies
ap search.movies.size



poster()
Returns a string containing the URL to the movie poster.

