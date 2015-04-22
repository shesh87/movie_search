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

	def show
		@@results[0..8]
	end

	def search_movies(word)
		search = Imdb::Search.new(word)
		return search.movies[0...15]
		# @@results << search.movies
		# @@results << "123"
		# return @@results
	end

	def movie_properties(array)
		# good_movies = []
		array.each do |object|
			if object.poster != nil
				@@results << object
				# break if @@results == 9 
			end
		end
		# return good_movies[0..8]
	end

	def get_posters(array)
		posters = array.map do |movie|
			movie.poster
		end
		return posters
	end

	def get_year(array)
		year = []
		puts array
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
	results = session[:quiz].search_movies(params[:search_word])
	session[:quiz].movie_properties(results)
	binding.pry

	
	redirect to("/movies")
end

get "/movies" do
	@greeting = "HELLO"
	@movies = session[:quiz].show
	binding.pry
	# @year = session[:quiz].get_year(@movies)
	binding.pry
	# @movies = quiz2.movie_properties(quiz2.results)

	
	erb :movies
end



