require "sinatra"
require "pry"
require "sinatra/reloader" if development?
#allows updating to the server with out reloading it.
require "logger"
enable :logger
require "imdb"
enable :sessions


class IMDBSearch
# attr_accessor :results, :cheese

	@@results = []
	# @cheese = "cheese"

	def show
		@@results
	end

	def search_movies(word)
		search = Imdb::Search.new(word)
		# return search.movies[0..15]
		# @@results << search.movies[0...15]
		@@results << "123"
		# return @@results
	end

	def movie_properties(array)
		good_movies = []
		array.each do |object|
			if object.poster != nil
				good_movies << object 
			end
		end
		return good_movies[0..8]
	end

	def get_posters(array)
		posters = array.map do |movie|
			movie.poster
		end
		return posters
	end

	def get_year(array)
		year = []
		array.each do |movie|
			year << movie.year
		end
		return year.sample
	end

end



################################################################



get "/" do
	erb :index
end

post "/search" do
	session[:quiz] = IMDBSearch.new
	session[:quiz].search_movies(params[:search_word])
	binding.pry

	
	redirect to("/movies")
end

get "/movies" do
	@greeting = "HELLO"
	hi = session[:quiz]
	# quiz2 = IMDBSearch.new
	binding.pry
	# @movies = quiz2.movie_properties(quiz2.results)

	
	erb :movies
end





# def search_movies(word)
# 	search = Imdb::Search.new(word)
# 	return search.movies[0..15]
# end

# def movie_properties(array)
# 	good_movies = []
# 	array.each do |object|
# 		if object.poster != nil
# 			good_movies << object 
# 		end
# 	end
# 	return good_movies[0..8]
# end

# def get_posters(array)
# 	posters = array.map do |movie|
# 		movie.poster
# 	end
# 	return posters
# end

# def get_year(array)
# 	year = []
# 	array.each do |movie|
# 		year << movie.year
# 	end
# 	return year.sample
# end



