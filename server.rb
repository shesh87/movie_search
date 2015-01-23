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
	search = Imdb::Search.new(word)
	return search.movies
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



get "/" do
	erb :index
end

post "/search" do
	word = params[:search_word]
	search_results = search_movies(word)
	posters_yes = posters?(search_results) #returns array of movies that have posters
	got_posters = posters!(posters_yes)

	session[:posters] = got_posters[0..8]
	# binding.pry
	redirect to("/movies")
end

get "/movies" do
	@posters = session[:posters]
	erb :movies
end


