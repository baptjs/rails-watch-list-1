class List < ApplicationRecord
  has_many :saved_movies, dependent: :destroy
  has_many :movies, through: :saved_movies
  # has_one_attached :photo

  validates :name, uniqueness: true, presence: true
end
