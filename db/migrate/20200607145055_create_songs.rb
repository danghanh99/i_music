class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :artist
      t.text :lyric
      t.integer :point
      t.string :name
      t.timestamps
    end

  end
end
