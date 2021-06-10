class MoviesController < ApplicationController

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path
    else
      render "new"
    end
  end

  def index
    @movies = Movie.all
    @quantity = Movie.count
  end

  def show
    @movie = Movie.find(params[:id])
    @user = @movie.user
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
