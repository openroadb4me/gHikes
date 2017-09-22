class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name
      t.integer :distance
      t.string :difficulty
      t.text :description
      t.string :image
      t.string :link
      t.boolean :completed

      t.timestamps null: false
    end
    add_attachment :tracks, :gpx
  end
end
