class RelationshipsController < ApplicationController

  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
    # 遷移元のURLを取得してリダイレクト
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
    # 遷移元のURLを取得してリダイレクト
  end



end
