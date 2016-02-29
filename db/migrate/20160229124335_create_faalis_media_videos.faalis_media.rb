# This migration comes from faalis_media (originally 20160227124855)
class CreateFaalisMediaVideos < ActiveRecord::Migration
  def change
    create_table :faalis_media_videos do |t|
      t.string :caption
      t.text :subcaption

      t.timestamps null: false
    end
  end
end
