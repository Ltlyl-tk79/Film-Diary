class Movie < ApplicationRecord
  attachment :image, destroy: false
end
