class SearchesController < ApplicationController
  def search
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
      # 検索方法と検索ワードを参照してデータを検索
      # looksメソッドを使用し、検索内容を取得し、変数を代入
    else
      @movies = Movie.looks(params[:search], params[:word])
      # 検索方法と検索ワードを参照してデータを検索
      # looksメソッドを使用し、検索内容を取得し、変数を代入
    end
  end
end
