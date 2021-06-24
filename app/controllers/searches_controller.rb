class SearchesController < ApplicationController
  def search
    @range = params[:range]
    @word = params[:word]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
      # 検索方法と検索ワードを参照してデータを検索
      # looksメソッドを使用し、検索内容を取得し、変数を代入
       @quantity = @users.count
    else
      @movies = Movie.looks(params[:search], params[:word]).page(params[:page]).reverse_order
      # 検索方法と検索ワードを参照してデータを検索
      # looksメソッドを使用し、検索内容を取得し、変数を代入
       @quantity = @movies.count
    end
  end
end
