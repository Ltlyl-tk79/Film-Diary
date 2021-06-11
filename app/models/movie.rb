class Movie < ApplicationRecord
  attachment :movie_image, destroy: false

  belongs_to :user
  has_many :movie_comments, dependent: :destroy
  
end
