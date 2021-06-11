class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    # @movie = Movie.find(parms[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end
end
