class CreateSongFavoriteSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :song_favorite_songs do |t|
      t.references :song, null: false, foreign_key: true
      t.references :favorite_song, null: false, foreign_key: true

      t.timestamps
    end
  end
end
