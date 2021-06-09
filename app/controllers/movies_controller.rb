class MoviesController < ApplicationController

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_prams)
    if @movie.save
      redirect_to movie_path(@movie.id)
    else
      render "new"
    end
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def movie_params
    params.require(:movie).permit(:title, :body, :movie_image)
  end

end
