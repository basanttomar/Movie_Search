class Movie < ApplicationRecord

  has_many :mactors
  has_many :actors, through: :mactors

  searchable do
    text :name
    text :country
    text :language
    text :actor_name do 
      actors.map(&:name) 
    end 
      text :year
      text :genere

  end

  def self.search_movie(query)
    result = Movie.search do
      fulltext query do
        fields(:language,:country,:actor_name,:year,:genere,:name => 5.0)
        

      end
    end
    result.results
  end

  def self.fetch_movies_data
    url = 'https://raw.githubusercontent.com/hjorturlarsen/IMDB-top-100/master/data/movies.json'
    response = RestClient.get url
    json_response = JSON.parse response
    json_response.each do |res|
      imdb_url = 'http://www.omdbapi.com/?i=' + res["id"] + '&plot=short&r=json'
      movie_response = RestClient.get imdb_url
      movie_json = JSON.parse movie_response
      @movie = Movie.create(name: movie_json["Title"], year: movie_json["Year"].to_i, rating: movie_json["imdbRating"],
      genere: movie_json["Genre"], language: movie_json["Language"], country: movie_json["Country"])

      movie_json["Actors"].split(",").each do |actor_json|
        actor_name =  actor_json.strip
        @actor = Actor.find_by(name: actor_name)
        if !@actor
          @actor = Actor.create(name: actor_name)
        end
        Mactor.create!(movie_id: @movie.id, actor_id: @actor.id)
      end
    end
  end
end