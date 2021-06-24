class MoviesController < ApplicationController

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user = current_user

    if @movie.save
      redirect_to movies_path, notice: "新規投稿に成功しました"
    else
      render "new"
    end
  end

  def index
    @movies = Movie.page(params[:page]).reverse_order
    @quantity = Movie.count

  end

  def show
    @movie = Movie.find(params[:id])
    @user = current_user
    @movie_user = @movie.user
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
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to user_path(@movie.user)
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :body, :movie_image, :evaluation)
  end

end
