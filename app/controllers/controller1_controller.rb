class Controller1Controller < ApplicationController
  require 'json'
  require 'open-uri'

  def index

    if params['title']
      title = params['title'].downcase.gsub(/[^a-z\s]/, '')
    else
      title = ""
    end

    if params['search'] == "Search" && title.length > 0
      json_url = "http://api.rottentomatoes.com/api/public/v1.0/movies.json?q=" + title.gsub(" ", "+") +  "&page_limit=16&page=1&apikey=g6cqn75znnpt294mvqbbaxsz"
     @searching = true
    else
      json_url = "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?limit=16&country=us&apikey=g6cqn75znnpt294mvqbbaxsz"
      @searching = false
    end

     @movie_data = JSON.parse(open(json_url).read)
     @movie_data = @movie_data["movies"]

    @search_text = title
  end

end
