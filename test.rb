require "Imdb"
require "pp"

def search_movies(word)
	search = Imdb::Search.new(word)
	return search.movies.poster
end

results = []

search = Imdb::Search.new("deeds")
results << search.movies


# now = results.each do |x|

# 	return results[x]
# end

# movie1 = results[0]
# puts movie1.id

# # movie_ids = results.map do |movie|
# # 	results.id
# # end

# # put movie_ids
# now = test.each do |x|
# 	Imdb::Movie.new(x)
# end

# movie_id = Imdb::Movie.new("0027996")
# puts movie_id.poster




