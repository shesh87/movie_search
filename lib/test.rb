require "Imdb"
require "pp"


class MovieSearch
	def search_movies(word)
		search = Imdb::Search.new(word)
		results << search.movies
	end

	def posters?(array)
		array[0..20].select do |movie|
			movie.poster != nil
		end
	end

	def posters!(array)
		session[:nine] = array.map do |movie|
			movie.poster
		end

		# if session[:nine].length < 9
		# 	return "Sorry"
		# end
	end
end

results = []



my_movie = MovieSearch.new
my_movie.search_movies "funny"
posters_yes = my_movie.posters?(results)
got_posters = my_movie.posters!(posters_yes)



	# search_results = search_movies(word)
	# posters_yes = posters?(search_results) #returns array of movies that have posters
	# got_posters = posters!(posters_yes)
	session[:posters] = got_posters[0..8]














