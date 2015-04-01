require "sinatra"
require "pry"
require "sinatra/reloader" if development?
require "logger"
enable :logger
require "imdb"
enable :sessions


class MovieSearch
	attr_accessor :movies
	

	def search_imdb(word)
		imdb = Imdb::Search.new(word)
		search_results = imdb.movies[0..20]
		@movies = search_results.select do |movie|
			movie.poster != nil
		end
	end

	def posters
		@movies.each do |movie|
			{img: movie.poster, id: movie.id}
		end
	end

	# def get_posters(array)
	# 	session[:yes] = array.map do |movie|
	# 		movie.poster
	# 	end
	# end



	# def posters?(array)
	# 	array[0..20].map do |movie|
	# 		movie.poster != nil
	# 	end
	# 	# session[:nine] = posters.map do |movie|
	# 	# 	movie.poster
	# 	# end
	# end

	# def posters!(array)
	# 	session[:nine] = array.map do |movie|
	# 		movie.poster
	# 	end
	# end

	def year
		random = @movies.map do |movie|
			movie.year
		end
		return random.sample
	end

	def titles
		@movies.map do |movie|
			movie.title
		end
	end

end

# movies = []

################################################################



get "/" do
	erb :index
end

post "/search" do
	search = MovieSearch.new
	search.search_imdb(params[:search_word])
	# binding.pry
	session[:posters] = search.posters#(movies)
	# session[:year] = search.year#(movies)
	# session[:titles] = search.titles

	# posters_true = search.posters
	# session[:posters] = search.get_posters(posters_true)
	binding.pry

	# session[:year] = search.year?(@movies)

	redirect to("/movies2")
end

get "/movies2" do
	@posters = session[:posters]
	@titles = session[:titles]
	@year = session[:year]
	erb :movies2
end





