class FavoriteSong < ApplicationRecord
  belongs_to :user
  has_many :song_favorite_songs, dependent: :destroy
  has_many :songs, through: :song_favorite_songs

  validates :name, presence: true, length: { minimum: 3, maximum: 30 }
  accepts_nested_attributes_for :song_favorite_songs

end
