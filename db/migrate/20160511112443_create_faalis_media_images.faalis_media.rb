# This migration comes from faalis_media (originally 20160227124832)
class CreateFaalisMediaImages < ActiveRecord::Migration
  def change
    args = {}
    args = { id: :uuid } if Faalis::Engine.use_uuid

    create_table :faalis_media_images, **args do |t|
      t.string :caption
      t.text :subcaption

      t.timestamps null: false
    end
    add_attachment :faalis_media_images, :image
  end
end
