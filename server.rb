require "sinatra"
require "pry"
require "sinatra/reloader" if development?
#allows updating to the server with out reloading it.
require "logger"
enable :logger



def search_movies(word)
	
end

search = Imdb::Search.new(“mr.deeds”)

get "/" do
	word = params[:search_word]
	erb :index
end


post "/search" do
	
end