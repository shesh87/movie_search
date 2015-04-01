require "sinatra"
require "pry"
require "sinatra/reloader" if development?
#allows updating to the server with out reloading it.
require "logger"
enable :logger
require "imdb"
enable :sessions


results = []

def search_movies(word)
	search[0..20] = Imdb::Search.new(word)
	return search.movies#[0..20]
end

def posters?(array)
	array[0..20].select do |movie|
		movie.poster != nil
	end
end

def posters!(array)
	array.map do |movie|
		movie.poster
	end
end

def year?(array)
	year = array.map do |movie|
		movie.year
	end
	session[:year] = year.sample
end

def movie_properties(array)
	posters = []
	array.each do |object|
		if object.poster != nil
			posters << object.poster 
		end
	end
	return posters
end


################################################################



get "/" do
	erb :index
end

post "/search" do
	search_results = search_movies(params[:search_word])
	binding.pry
	# binding.pry
	session[:posters] = movie_properties(search_results)[0..8]
	# binding.pry
	# posters_yes = posters?(search_results) #returns array of movies that have posters
	
	# got_posters = posters!(posters_yes)


	# session[:posters] = got_posters[0..8]
	# session[:year] = year?(posters_yes)
	redirect to("/movies")
end

get "/movies" do
	@posters = session[:posters]
	@year = session[:year]
	erb :movies
end












#TESTING NEW STRATEGY



# require "sinatra"
# require "pry"
# require "sinatra/reloader" if development?
# require "logger"
# enable :logger
# require "imdb"
# enable :sessions


# class MovieSearch
# 	attr_accessor :movies
	

# 	def search_imdb(word)
# 		imdb = Imdb::Search.new(word)
# 		@movies = imdb.movies[0..20]
# 	end

# 	def posters
# 		@movies.map do |movie|
# 			movie.poster
# 		end
# 		# yes.map { |movie| movie.poster }
# 	end

# 	def get_posters(array)
# 		session[:yes] = array.map do |movie|
# 			movie.poster
# 		end
# 	end



# 	# def posters?(array)
# 	# 	array[0..20].map do |movie|
# 	# 		movie.poster != nil
# 	# 	end
# 	# 	# session[:nine] = posters.map do |movie|
# 	# 	# 	movie.poster
# 	# 	# end
# 	# end

# 	# def posters!(array)
# 	# 	session[:nine] = array.map do |movie|
# 	# 		movie.poster
# 	# 	end
# 	# end

# 	def year?(array)
# 		year = array.map do |movie|
# 			movie.year
# 		end
# 		session[:year] = year.sample
# 	end

# end


# ################################################################



# get "/" do
# 	erb :index
# end

# post "/search" do
# 	search = MovieSearch.new
# 	search.search_imdb(params[:search_word])
# 	session[:movies] = search.posters
# 	# posters_true = search.posters
# 	# session[:posters] = search.get_posters(posters_true)
# 	# binding.pry

# 	# session[:year] = search.year?(@movies)

# 	redirect to("/movies")
# end

# get "/movies" do
# 	@posters = session[:posters]
# 	@movies = session[:movies]
# 	# binding.pry
# 	@year = session[:year]
# 	erb :movies
# end





