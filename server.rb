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

def posters(array)
	array[1..9].map do |movie|
		movie.poster
	end
end


get "/" do
	erb :index
end

post "/search" do
	word = params[:search_word]
	results = search_movies(word)
	posters = posters(results)
	session[:posters] = posters
	# binding.pry
	redirect to("/movies")
end

get "/movies" do
	@posters = session[:posters]
	erb :movies
end


