require "sinatra"
require "pry"
require "sinatra/reloader" if development?
#allows updating to the server with out reloading it.
require "logger"
enable :logger
require "imdb"

results = []

def search_movies(word)
	search = Imdb::Search.new(word)
	return search.movies
end

# search = Imdb::Search.new(“mr.deeds”)

get "/" do
	erb :index
end


post "/search" do
	word = params[:search_word]
	results << search_movies(word)
	# session[:results] = results

	binding.pry
	redirect to("/movies")
end

get "/movies" do
	erb :movies
end