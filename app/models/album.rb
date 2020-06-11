class Album < ApplicationRecord
  has_many :album_songs, dependent: :destroy
  has_many :songs, through: :album_songs
  validates :name, presence: true, length: { minimum: 3, maximum: 30 }
end
