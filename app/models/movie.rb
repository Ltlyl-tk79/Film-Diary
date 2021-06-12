class Movie < ApplicationRecord
  attachment :movie_image, destroy: false

  belongs_to :user
  has_many :movie_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.looks(search,word)
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
