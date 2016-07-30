class MoviesController < ApplicationController
  def search
    # render :json => Movie.all
    respond_to do |format|
      format.html
      format.json do
        render :json => Movie.search_movie(params[:term])
      end
    end
  end


  def search_movie
    @result = Movie.search_movie params[:term]
    render :json => @result
  end

  def index
    @movies = Movie.all
    respond_to do |format|
      format.html
      format.json do
        render :json => @movies
      end
    end
  end
end
