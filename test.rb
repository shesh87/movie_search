require "Imdb"

def search_movies(word)
	search = Imdb::Search.new(word)
	return search.movies
end

search = Imdb::Search.new("deeds")
puts search.movies