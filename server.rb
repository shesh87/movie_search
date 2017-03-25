require "sinatra"
require "pry"
require "sinatra/reloader" if development?
#allows updating to the server with out reloading it.
require "logger"
enable :logger
require "imdb"
enable :sessions


class IMDBSearch
attr_accessor :results, :year

	@@results = []

	def show
		# binding.pry
		@@results[0..8]
	end

	def search_movies(word)
		search = Imdb::Search.new(word)
		return search.movies[0...15]
		# return search.movies[0]

	end

	def movie_properties(array)
		# good_movies = []
		array.each do |object|
			binding.pry
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
		# get_year
	end

	def get_year(array)
		@year = []
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
	binding.pry
	session[:quiz].movie_properties(results)
	redirect to("/movies")
end

get "/movies" do
	@movies = session[:quiz].show
	@year = session[:quiz].get_year(@movies)
	erb :movies
end



