class Movie < ApplicationRecord
  has_many :saved_movies

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
end
