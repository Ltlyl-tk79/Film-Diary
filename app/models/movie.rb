class Movie < ApplicationRecord
  attachment :movie_image, destroy: false

  belongs_to :user
  has_many :movie_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
    # 引数に渡したユーザーを既にイイねしてるかを判定する
  end

  def self.looks(search,word)
    # whereメソッドを使いデータベースから該当データを取得し、変数に代入
    if search == "perfect_match"
      @movie = Movie.where("title LIKE?", "#{word}")
    elsif search == "forward_match"
      @movie = Movie.where("title LIKE?", "#{word}%")
    elsif search == "backward_match"
      @movie = Movie.where("title LIKE?", "%#{word}")
    elsif search == "partical_match"
      @movie = Movie.where("title LIKE?", "%#{word}%")
    else
      @movie = Movie.all
    end
  end


end
