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
    @movie_comment = MovieComment.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movie_path(@movie)
    else
      render "edit"
    end
  end

  def destroy
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :body, :movie_image)
  end

end
