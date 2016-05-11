# This migration comes from faalis_media (originally 20160227124927)
class CreateFaalisMediaFiles < ActiveRecord::Migration
  def change
    args = {}
    args = { id: :uuid } if Faalis::Engine.use_uuid

    create_table :faalis_media_files, **args do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end

    add_attachment :faalis_media_files, :file
  end
end
