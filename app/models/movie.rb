class Movie < ApplicationRecord
  attachment :movie_image, destroy: false

  belongs_to :user
end
