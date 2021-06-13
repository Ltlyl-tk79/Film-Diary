class MovieCommentsController < ApplicationController

  def create
    @movie = Movie.find(params[:movie_id])
    @user = current_user
    # comment = current_user.movie_comment.new(movie_comment_params)
    movie_comment = MovieComment.new(movie_comment_params)
    movie_comment.user_id = current_user.id
    movie_comment.movie_id = @movie.id
    if movie_comment.save
      # redirect_to movie_path(movie.id)
    else
      render "movies/show"
    end
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @user = current_user
    MovieComment.find(params[:id]).destroy
    # redirect_to movie_path(movie.id)
  end

  private

  def movie_comment_params
    params.require(:movie_comment).permit(:comment)
  end
end
